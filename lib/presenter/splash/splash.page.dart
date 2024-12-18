import 'package:findu/data/repository/firebase.repo.dart';
import 'package:findu/route.path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Page'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                context.push(RouterPath.routerHome);
              },
              child: const Text("Go to Home"),
            ),
            TextButton(
              onPressed: () {
                context.push(RouterPath.routerRegister);
              },
              child: const Text("Go to Register"),
            ),
            TextButton(
                onPressed: () {
                  context
                      .read<FirebaseRepo>()
                      .getUserById(idUser: 'Uvh3juFQLhqC31jVbU7Z')
                      .then((onValue) {
                    print("---user: ${onValue.name}");
                  });
                },
                child: const Text("Uvh3juFQLhqC31jVbU7Z"))
          ],
        ),
      ),
    );
  }
}
