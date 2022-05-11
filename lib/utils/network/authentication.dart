import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Authentication extends GetConnect {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
          (value) => {
            if (value.user != null)
              {
                print(value.user?.uid),
              },
          },
        );
  }

  Future<void> registerUser({
    required String name,
    required String firstName,
    required String userName,
    required String email,
    required String password,
  }) async {
    await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async => {
              if (value.user != null)
                {
                  await FirebaseFirestore.instance.collection('users').add({
                    'firstName': name,
                    'lastName': firstName,
                    'userName': userName,
                    'email': email,
                  })
                }
            });
  }

  bool findNewUser() {
    String? lastDingInDate =
        _firebaseAuth.currentUser?.metadata.lastSignInTime.toString();
    String? creationTimestamp =
        _firebaseAuth.currentUser?.metadata.creationTime.toString();
    if (lastDingInDate == creationTimestamp) {
      return true;
    } else {
      print("user vechi");
      return false;
    }
  }

}
