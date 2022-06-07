import 'package:get/get.dart';
import 'package:travel_app/ui/upload_documents/components/add_document_widget.dart';
import 'package:travel_app/ui/upload_documents/components/documents_list_screen.dart';

class UploadDocumentsController extends GetxController {
  void redirectAddDocument() {
    Get.to(
      () => AddDocumentWidget(),
    );
  }

  void redirectDocumentsList(String title) {
    Get.to(
      () => DocumentsListScreen(
        title: title,
      ),
    );
  }
}
