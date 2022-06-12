import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/ui/widgets/dialogs/loading_dialog.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';
import 'package:travel_app/utils/network/firebase/firestore/users_collection.dart';
import 'package:travel_app/utils/session_temp.dart';

class PhotoAlbumController extends GetxController {
  RxList<String> list = <String>[].obs;
  String nameTrip;
  RxString img = "".obs;
  File? imageFile;

  PhotoAlbumController({
    required this.nameTrip,
  });

  Future<void> uploadPhoto() async {
    try {
      Get.dialog(
        const LoadingDialog(),
      );
      await UsersCollection()
          .savePhoto(
            tripName: nameTrip,
            photoURL: img.value,
            uid: userLoggedIn.uid,
            imageFile: imageFile,
            imageSource: ImageSource.camera,
          )
          .then((value) => {
                Get.back(),
                FirebaseStorage.instance
                    .ref(userLoggedIn.uid)
                    .child("documents/$nameTrip/${userLoggedIn.uid}")
                    .getDownloadURL()
                    .then(
                      (value) async => {
                        img.value = value,
                        await UsersCollection()
                            .savePhotoInFirebase(
                              photoURL: img.value,
                              tripName: nameTrip,
                            )
                            .then(
                              (value) => {
                                Get.defaultDialog(
                                  title: "Success!",
                                  middleText:
                                      "Your document has been uploaded!",
                                  backgroundColor: kGeneralColor,
                                  titleStyle: kNormalTextStyle,
                                  radius: 10,
                                ).then(
                                  (value) => Get.back(),
                                ),
                              },
                            ),
                      },
                    ),
              });
    } catch (e) {
      print(e.toString());
    }
  }
}
