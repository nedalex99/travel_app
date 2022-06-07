import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/widgets/dialogs/loading_dialog.dart';
import 'package:travel_app/utils/session_temp.dart';

class DocumentsListController extends GetxController {
  String title;
  RxString img = "".obs;
  dynamic data;

  DocumentsListController({
    required this.title,
  });

  @override
  onInit() {
    getDocuments();
    super.onInit();
  }

  Future<void> getDocuments() async {
    try {
      Get.dialog(
        const LoadingDialog(),
      );
      await FirebaseFirestore.instance
          .collection('documents')
          .doc('${userLoggedIn.uid}ceva')
          .get()
          .then<dynamic>((DocumentSnapshot snapshot) async {
        data = snapshot.data();
        img.value = data['url'];
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
