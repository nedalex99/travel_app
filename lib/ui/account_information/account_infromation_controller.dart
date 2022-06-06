import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/model/user_data.dart';
import 'package:travel_app/model/user_model.dart';
import 'package:travel_app/ui/widgets/dialogs/loading_dialog.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';
import 'package:travel_app/utils/constants/validator.dart';
import 'package:travel_app/utils/network/firebase/firestore/users_collection.dart';
import 'package:travel_app/utils/session_temp.dart';

class AccountInformationController extends GetxController {
  RxBool isButtonEnabled = false.obs;
  final String? uid = FirebaseAuth.instance.currentUser?.uid;
  Rx<UserData> userData =
      UserData(firstName: "", lastName: "", userName: "").obs;
  RxString img = "".obs;
  File? imageFile;
  final TextEditingController firstNameTextController = TextEditingController();
  final TextEditingController lastNameTextController = TextEditingController();
  final TextEditingController usernameTextController = TextEditingController();

  void onInputChanged(String value) {
    isButtonEnabled.value = isValidName(firstNameTextController.text) == null &&
        isValidName(lastNameTextController.text) == null &&
        isValidName(usernameTextController.text) == null;
  }

  @override
  void onInit() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      getUserData();
      getImage();
    });
    super.onInit();
  }

  Future<void> getUserData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) => {
              userData.value = UserData.fromJson(value),
              firstNameTextController.text =
                  userData.value.firstName.toString(),
              lastNameTextController.text = userData.value.lastName.toString(),
              usernameTextController.text = userData.value.userName.toString(),
            });
  }

  Future<void> getImage() async {
    await FirebaseStorage.instance
        .ref(uid)
        .child("images/$uid")
        .getDownloadURL()
        .then((value) => {
              img.value = value,
            });
  }

  Future<void> updateUser() async {
    try {
      Get.dialog(
        const LoadingDialog(),
      );
      UserModel userModel = UserModel(
        lastName: lastNameTextController.text,
        firstName: firstNameTextController.text,
        userName: usernameTextController.text,
        email: userLoggedIn.email.toString(),
      );

      await UsersCollection()
          .updateUser(userModel: userModel, uid: userLoggedIn.uid)
          .then((value) => {
                Get.back(),
                Get.defaultDialog(
                  title: "Success!",
                  middleText: "Your data has been modified.",
                  backgroundColor: kGeneralColor,
                  titleStyle: kNormalTextStyle,
                  radius: 10,
                ),
              });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateImage(ImageSource imageSource) async {
    try {
      Get.dialog(
        const LoadingDialog(),
      );
      await UsersCollection()
          .updateImageUser(
            photoURL: img.value,
            uid: userLoggedIn.uid,
            imageFile: imageFile,
            imageSource: imageSource,
          )
          .then((value) => {
                Get.back(),
                Get.defaultDialog(
                  title: "Success!",
                  middleText: "Your picture has been modified.",
                  backgroundColor: kGeneralColor,
                  titleStyle: kNormalTextStyle,
                  radius: 10,
                ),
              });
    } catch (e) {
      print(e.toString());
    }
  }
}
