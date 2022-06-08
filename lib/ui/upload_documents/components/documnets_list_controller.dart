import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/image_model.dart';
import 'package:travel_app/ui/widgets/dialogs/loading_dialog.dart';
import 'package:travel_app/utils/session_temp.dart';

class DocumentsListController extends GetxController {
  String title;
  RxList<ImageModel> imageList = <ImageModel>[].obs;
  dynamic data;

  DocumentsListController({
    required this.title,
  });

  @override
  Future<void> onInit() async {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      await getDocuments();
    });
    super.onInit();
  }

  Future<void> getDocuments() async {
    try {
      await FirebaseFirestore.instance
          .collection('documents')
          .doc(userLoggedIn.uid)
          .collection(title)
          .get()
          .then((QuerySnapshot snapshot) async {
        snapshot.docs.forEach((element) {
          imageList.add(
            ImageModel(
              url: (element.data() as Map)['url'],
              name: (element.data() as Map)['name'],
            ),
          );
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
