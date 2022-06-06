import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/widgets/dialogs/loading_dialog.dart';

class DocumentsListController extends GetxController {
  String title;
  RxString img = "".obs;

  DocumentsListController({
    required this.title,
  });

  onInit() {
    getDocuments();
    super.onInit();
  }

  Future<void> getDocuments() async {
    try {
      Get.dialog(
        const LoadingDialog(),
      );
      await FirebaseStorage.instance
          .ref(FirebaseAuth.instance.currentUser?.uid)
          .child(
              "documents/$title/almeu/${FirebaseAuth.instance.currentUser?.uid}")
          .getDownloadURL()
          .then((value) => {
                img.value = value,
              });
    } catch (e) {
      print(e.toString());
    }
  }
}
