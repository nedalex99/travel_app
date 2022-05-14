import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/user_model.dart';

class UsersCollection extends GetConnect {
  Future<void> addUser({
    required UserModel userModel,
    required String uid,
  }) async {
    return FirebaseFirestore.instance.collection('users').doc(uid).set(
          userModel.toJson(),
        );
  }
}
