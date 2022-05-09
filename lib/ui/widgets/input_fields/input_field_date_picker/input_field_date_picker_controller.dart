import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputFieldDatePickerController extends GetxController {
  void getDate() {
    showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );
  }
}
