import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class Authentication extends GetConnect {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    const SpinKitRotatingCircle(
      color: Colors.blue,
      size: 24.0,
      duration: Duration(
        seconds: 5,
      ),
    );
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
    const SpinKitRotatingCircle(
      color: Colors.blue,
      size: 24.0,
      duration: Duration(
        seconds: 5,
      ),
    );
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
}
