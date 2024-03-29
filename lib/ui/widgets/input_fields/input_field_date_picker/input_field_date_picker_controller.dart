import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InputFieldDatePickerController extends GetxController {
  TextEditingController textController;

  InputFieldDatePickerController({
    required this.textController,
  });

  Future<void> getDate({
    required bool isBirthday,
  }) async {
    DateTime? selectedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: isBirthday ? DateTime(1900) : DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (selectedDate != null) {
      textController.text =
          DateFormat("dd-MM-yyyy").format(selectedDate).toString();
    }
  }
}
