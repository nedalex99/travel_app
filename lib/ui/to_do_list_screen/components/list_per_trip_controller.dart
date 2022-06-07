import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/to_do_model.dart';
import 'package:travel_app/ui/to_do_list_screen/components/add_to_do_screen.dart';
import 'package:travel_app/utils/session_temp.dart';

class ListPerTripController extends GetxController {
  RxList<ToDo> list = <ToDo>[].obs;

  @override
  void onInit() {
    getNotes();
    super.onInit();
  }

  void redirectAddToDoScreen() {
    Get.to(
      () => AddToDoScreen(),
    );
  }

  Future<void> getNotes() async {
    await FirebaseFirestore.instance
        .collection('to-do')
        .doc(userLoggedIn.uid)
        .get()
        .then((value) => {
              list.add(value['title']),
            });
  }
}
