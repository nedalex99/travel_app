import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/to_do_model.dart';
import 'package:travel_app/utils/session_temp.dart';

class ToDoCardController extends GetxController {
  String nameTrip;
  RxList<ToDo> list;
  RxBool isChecked = false.obs;

  ToDoCardController({
    required this.nameTrip,
    required this.list,
  });

  void onInputChanged(String value) {
    isChecked.value;
  }

  Future<void> editNote() async {}

  Future<void> deleteNote() async {
    try {
      await FirebaseFirestore.instance
          .collection('to-do')
          .doc(userLoggedIn.uid)
          .collection(nameTrip)
          .get()
          .then((QuerySnapshot snapshot) async {
        snapshot.docs.forEach((e) {
          list.removeWhere(
              (element) => element.title == (e.data() as Map)['title']);
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
