import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findu/data/model/user.firebase.model.dart';

class FirebaseRepo {
  final CollectionReference<Map<String, dynamic>> _userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<UserFirebase> getUserById({required String idUser}) async {
    DocumentSnapshot<UserFirebase> snapshot = await _userCollection
        .doc(idUser)
        .withConverter(
            fromFirestore: (snap, options) =>
                UserFirebase.fromJson(snap.data() ?? {}),
            toFirestore: (value, options) => value.toJson())
        .get();

    return snapshot.data() ?? UserFirebase();
  }

  Stream<UserFirebase> userFirebaseStream({required String idUser}) {
    return _userCollection
        .doc(idUser)
        .withConverter(
            fromFirestore: (snap, option) =>
                UserFirebase.fromJson(snap.data() ?? {}),
            toFirestore: (value, option) => value.toJson())
        .snapshots()
        .map(
      (event) {
        return event.data() ?? UserFirebase();
      },
    );
  }

  void updateUserFirebase({required String userId}) {
    _userCollection
        .doc(userId)
        .withConverter(
            fromFirestore: (snap, options) =>
                UserFirebase.fromJson(snap.data() ?? {}),
            toFirestore: (value, options) => value.toJson())
        .set(UserFirebase(
          age: 2,
          name: 'changename',
        ));
  }
}
