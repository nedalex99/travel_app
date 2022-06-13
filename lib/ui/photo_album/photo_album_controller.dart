import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/photo_model.dart';
import 'package:travel_app/ui/widgets/dialogs/loading_dialog.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';
import 'package:travel_app/utils/network/firebase/firestore/users_collection.dart';
import 'package:travel_app/utils/session_temp.dart';

class PhotoAlbumController extends GetxController {
  RxList<PhotoModel> list = <PhotoModel>[].obs;
  String nameTrip;

  PhotoAlbumController({
    required this.nameTrip,
  });

  @override
  Future<void> onInit() async {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      await getPhotos();
    });
    super.onInit();
  }

  Future<void> uploadPhoto() async {
    try {
      Get.dialog(
        const LoadingDialog(),
      );
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg'],
      );
      final path = result?.files.single.path;
      final fieldName = result?.files.single.name;
      UsersCollection()
          .choosePhoto(
        filePath: path,
        tripName: nameTrip,
        fileName: fieldName,
      )
          .then((value) =>
      {
        UsersCollection()
            .savePhotoInFirebase(
          photoName: fieldName,
          tripName: nameTrip,
        )
            .then((value) =>
        {
          Get.defaultDialog(
            title: "Success!",
            middleText: "Your document has been uploaded!",
            backgroundColor: kGeneralColor,
            titleStyle: kNormalTextStyle,
            radius: 10,
          ).then((value) => Get.back())
        })
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getPhotos() async {
    try {
      await FirebaseFirestore.instance
          .collection('photos')
          .doc(userLoggedIn.uid)
          .collection(nameTrip)
          .get()
          .then((QuerySnapshot snapshot) async {
        snapshot.docs.forEach((element) {
          list.add(
            PhotoModel(
              url: (element.data() as Map)['url'],
            ),
          );
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }
}