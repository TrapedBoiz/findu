import 'package:findu/main.dart';
import 'package:findu/presenter/home/home.page.dart';
import 'package:findu/presenter/register/register.page.dart';
import 'package:findu/presenter/splash/splash.page.dart';
import 'package:findu/route.path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/rxdart.dart';

final GoRouter routerMain = GoRouter(
  observers: [MyNavigatorObserver()],
  navigatorKey: navigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: RouterPath.routerHome,
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
        ),
        GoRoute(
          path: RouterPath.routerRegister,
          builder: (BuildContext context, GoRouterState state) {
            return const RegisterPage();
          },
        ),
      ],
    ),
  ],
);



class MyNavigatorObserver extends NavigatorObserver {
  static var listRoute = <String>[];
  static final BehaviorSubject<String> currentRouter =
      BehaviorSubject<String>();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    listRoute.add(route.settings.name ?? '');
    if (listRoute.isNotEmpty) {
      currentRouter.add(listRoute.last);
    }
    print('didPush route ${listRoute.join(',')}');
  }

  String? get lastRoute {
    if (listRoute.isNotEmpty) {
      return listRoute.last;
    }
    return null;
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    listRoute.remove(route.settings.name ?? '');
    if (listRoute.isNotEmpty) {
      currentRouter.add(listRoute.last);
    }
    print('---current_route_path: ${listRoute.join(',')}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    listRoute.remove(route.settings.name ?? '');
    if (listRoute.isNotEmpty) {
      currentRouter.add(listRoute.last);
    }
    print('didRemove route ${listRoute.join(',')}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    listRoute.remove(oldRoute?.settings.name ?? '');
    listRoute.add(newRoute?.settings.name ?? '');
    if (listRoute.isNotEmpty) {
      currentRouter.add(listRoute.last);
    }
    print('didReplace route ${listRoute.join(',')}');
  }
}

extension RouterMain on BuildContext {
  void popUntilPath({required String routePath}) {
    final router = GoRouter.of(this);

    while (router.routerDelegate.currentConfiguration.last.route.path !=
        routePath) {
      if (!router.canPop()) {
        return;
      }

      debugPrint(
          '---popUntilPath from: ${router.routerDelegate.currentConfiguration.last.route.path}');
      router.pop();
    }
  }
}
