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

  void updateCheckBox(bool value) {
    isChecked.toggle();
  }

  Future<void> editNote() async {}

  Future<void> deleteNote(String title) async {
    try {
      await FirebaseFirestore.instance
          .collection('to-do')
          .doc(userLoggedIn.uid)
          .collection(nameTrip)
          .where('title', isEqualTo: title)
          .get()
          .then((value) => {
                value.docs.forEach((element) {
                  FirebaseFirestore.instance
                      .collection('to-do')
                      .doc(userLoggedIn.uid)
                      .collection(nameTrip)
                      .doc(title)
                      .delete();
                })
              });
      // .get()
      // .then((value) async {
      //   value.
      // snapshot.docs.forEach((e) {
      //   list.removeWhere(
      //       (element) => element.title == (e.data() as Map)['title']);
      // });
      //});
    } catch (e) {
      print(e.toString());
    }
  }
}
