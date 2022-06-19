import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/to_do_model.dart';
import 'package:travel_app/utils/session_temp.dart';

class ToDoCardController extends GetxController {
  String nameTrip;
  RxList<ToDo> list;
  RxBool isChecked = false.obs;
  final String cityName;

  ToDoCardController({
    required this.nameTrip,
    required this.list,
    required this.cityName,
  });

  void updateCheckBox(bool value) {
    isChecked.toggle();
  }

  Future<void> editNote() async {}

  Future<void> deleteNote(String title, String cityName) async {
    try {
      print(cityName);
      await FirebaseFirestore.instance
          .collection('to-do')
          .doc(userLoggedIn.uid)
          .collection(cityName)
          .where('title', isEqualTo: title)
          .get()
          .then((value) => {
                value.docs.forEach((element) {
                  FirebaseFirestore.instance
                      .collection('to-do')
                      .doc(userLoggedIn.uid)
                      .collection(cityName)
                      .doc(element.id)
                      .delete()
                      .then((value) {
                    list.removeWhere((element) => element.title == title);
                  });
                })
              });
    } catch (e) {
      print(e.toString());
    }
  }
}
