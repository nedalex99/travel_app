import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/ui/widgets/dialogs/loading_dialog.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';
import 'package:travel_app/utils/constants/validator.dart';
import 'package:travel_app/utils/network/firebase/firestore/users_collection.dart';
import 'package:travel_app/utils/session_temp.dart';

class AddDocumentWidgetController extends GetxController {
  RxString img = "".obs;
  File? imageFile;
  final TextEditingController nameDocumentTextController =
      TextEditingController();
  RxBool isButtonEnabled = false.obs;
  TextEditingController typeOfDocumentTextController = TextEditingController();

  void onInputChanged(String value) {
    isButtonEnabled.value =
        isValidName(nameDocumentTextController.text) == null;
  }

  Future<void> uploadDocument() async {
    try {
      Get.dialog(
        const LoadingDialog(),
      );
      await UsersCollection()
          .updateDocumentsUser(
            photoURL: img.value,
            typeOfDocument: typeOfDocumentTextController.text,
            nameOfDocument: nameDocumentTextController.text,
            uid: userLoggedIn.uid,
            imageFile: imageFile,
            imageSource: ImageSource.camera,
          )
          .then((value) => {
                Get.back(),
                FirebaseStorage.instance
                    .ref(FirebaseAuth.instance.currentUser?.uid)
                    .child(
                        "documents/${typeOfDocumentTextController.text}/${nameDocumentTextController.text}/${FirebaseAuth.instance.currentUser?.uid}")
                    .getDownloadURL()
                    .then((value) => {
                          img.value = value,
                          UsersCollection().saveDocumentsInFirebase(
                            photoURL: img.value,
                            nameOfDocument: nameDocumentTextController.text,
                            typeOfDocument: typeOfDocumentTextController.text,
                          ),
                        }),
                Get.defaultDialog(
                  title: "Success!",
                  middleText: "Your document has been uploaded!",
                  backgroundColor: kGeneralColor,
                  titleStyle: kNormalTextStyle,
                  radius: 10,
                ).then(
                  (value) => Get.back(),
                ),
              });
    } catch (e) {
      print(e.toString());
    }
  }
}
