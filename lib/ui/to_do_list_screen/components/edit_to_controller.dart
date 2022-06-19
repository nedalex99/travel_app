import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/to_do_model.dart';
import 'package:travel_app/ui/to_do_list_screen/components/list_per_trip_controller.dart';
import 'package:travel_app/ui/to_do_list_screen/components/to_do_card.dart';
import 'package:travel_app/ui/to_do_list_screen/components/to_do_card_controller.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';
import 'package:travel_app/utils/session_temp.dart';

class EditToDoController extends GetxController {
  late final TextEditingController noteTextEditingController;
  final String defaultText;
  final int index;
  late final ToDoCardController controller;
  ToDo toDo = ToDo();

  EditToDoController({
    required this.defaultText,
    required this.index,
  }) {
    noteTextEditingController = TextEditingController(text: defaultText);
    controller = Get.find(tag: defaultText);
  }

  Future<void> editNote({
    required String nameTrip,
  }) async {
    await FirebaseFirestore.instance
        .collection('to-do')
        .doc(userLoggedIn.uid)
        .collection(controller.cityName)
        .where('title', isEqualTo: defaultText)
        .get()
        .then((value) => {
              value.docs.forEach((element) {
                FirebaseFirestore.instance
                    .collection('to-do')
                    .doc(userLoggedIn.uid)
                    .collection(controller.cityName)
                    .doc(element.id)
                    .update({
                  'title': noteTextEditingController.text,
                }).then(
                  (value) {
                    final ListPerTripController listPerTripController =
                        Get.find();
                    listPerTripController.list.removeAt(index);
                    listPerTripController.list.insert(
                      index,
                      ToDo(
                        title: noteTextEditingController.text,
                      ),
                    );
                  },
                );
              })
            });
  }
}
