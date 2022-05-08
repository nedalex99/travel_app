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
}
