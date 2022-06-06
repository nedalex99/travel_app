import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/model/user_model.dart';
import 'package:travel_app/utils/session_temp.dart';

class UsersCollection extends GetConnect {
  Future<void> addUser({
    required UserModel userModel,
    required String uid,
  }) async {
    return FirebaseFirestore.instance.collection('users').doc(uid).set(
          userModel.toJson(),
        );
  }

  Future<void> updateUser({
    required UserModel userModel,
    required String uid,
  }) async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update(userModel.toJson());
  }

  Future<void> updateImageUser({
    required String photoURL,
    required String uid,
    required File? imageFile,
    required ImageSource imageSource,
  }) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    imageFile = File(pickedFile!.path);
    TaskSnapshot taskSnapshot = await FirebaseStorage.instance
        .ref(uid)
        .child('images/$uid')
        .putFile(imageFile);
    taskSnapshot.ref.getDownloadURL();
  }

  Future<void> updatePassword({required String newPass}) async {
    userLoggedIn.updatePassword(newPass);
  }

  Future<void> updateDocumentsUser({
    required String photoURL,
    required String nameOfDocument,
    required String uid,
    required String typeOfDocument,
    required File? imageFile,
    required ImageSource imageSource,
  }) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    imageFile = File(pickedFile!.path);
    TaskSnapshot taskSnapshot = await FirebaseStorage.instance
        .ref(uid)
        .child('documents/$typeOfDocument/$nameOfDocument/$uid')
        .putFile(imageFile);
    taskSnapshot.ref.getDownloadURL();
  }

  Future<void> saveDocumentsInFirebase({
    required String photoURL,
    required String nameOfDocument,
    required String typeOfDocument,
  }) async {
    FirebaseFirestore.instance
        .collection("documents")
        .doc("${userLoggedIn.uid}$nameOfDocument")
        .set(
      {
        'type': typeOfDocument,
        'name': nameOfDocument,
        'url': photoURL,
      },
    );
  }
}
