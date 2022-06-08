import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/to_do_model.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';
import 'package:travel_app/utils/session_temp.dart';

class AddToDoController extends GetxController {
  TextEditingController noteTextEditingController = TextEditingController();
  ToDo toDo = ToDo();

  Future<void> addNote({
    required String nameTrip,
  }) async {
    toDo = ToDo(title: noteTextEditingController.text);
    await FirebaseFirestore.instance
        .collection('to-do')
        .doc(userLoggedIn.uid)
        .collection(nameTrip)
        .add({
      'title': noteTextEditingController.text,
    });
  }
}
