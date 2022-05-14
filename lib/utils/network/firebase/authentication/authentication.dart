import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:travel_app/utils/network/firebase/authentication/sign_in_response.dart';
import 'package:travel_app/utils/responses/default_response.dart';
import 'package:travel_app/utils/responses/error_response.dart';

class Authentication extends GetConnect {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<DefaultResponse> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (userCredential.user != null) {
      return SignInResponse(
        statusCode: 200,
        user: userCredential.user!,
        status: 'success',
      );
    } else {
      return ErrorResponse(
        status: "error",
        statusCode: 400,
      );
    }
  }

  Future<DefaultResponse> registerUser({
    required String lastName,
    required String firstName,
    required String userName,
    required String email,
    required String password,
  }) async {
    UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (userCredential.user != null) {
      return SignInResponse(
        statusCode: 200,
        user: userCredential.user!,
        status: 'success',
      );
    } else {
      return ErrorResponse(
        status: "error",
        statusCode: 400,
      );
    }

    //
    // .then((value) async => {
    //       if (value.user != null)
    //         {
    //           await FirebaseFirestore.instance.collection('users').add({
    //             'firstName': name,
    //             'lastName': firstName,
    //             'userName': userName,
    //             'email': email,
    //           })
    //         }
    //     });
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
