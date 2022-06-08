import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/to_do_model.dart';
import 'package:travel_app/ui/to_do_list_screen/components/add_to_do_screen.dart';
import 'package:travel_app/utils/session_temp.dart';

class ListPerTripController extends GetxController {
  RxList<ToDo> list = <ToDo>[].obs;
  String nameTrip;

  ListPerTripController({
    required this.nameTrip,
  });

  @override
  onInit()  {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp)  {
       getNotes();
    });
    super.onInit();
  }

  void redirectAddToDoScreen(String nameTrip) {
    Get.to(
      () => AddToDoScreen(
        nameTrip: nameTrip,
      ),
    );
  }

  Future<void> getNotes() async {
    try {
      await FirebaseFirestore.instance
          .collection('to-do')
          .doc(userLoggedIn.uid)
          .collection(nameTrip)
          .get()
          .then((QuerySnapshot snapshot) async {
        snapshot.docs.forEach((element) {
          list.add(
            ToDo(
              title: (element.data() as Map)['title'],
            ),
          );
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
