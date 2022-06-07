import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/to_do_model.dart';
import 'package:travel_app/utils/session_temp.dart';

class AddToDoController extends GetxController {
  TextEditingController noteTextEditingController = TextEditingController();
  ToDo toDo = ToDo();

  Future<void> addNote() async {
    toDo = ToDo(title: noteTextEditingController.text);
    return FirebaseFirestore.instance
        .collection('to-do')
        .doc(userLoggedIn.uid)
        .set(toDo.toJson());
  }
}
