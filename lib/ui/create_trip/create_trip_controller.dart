import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CreateTripController extends GetxController {
  Rx<DateTime> selectedDate = DateTime(DateTime.now().year - 1).obs;

  Future<void> getDate() async {
    DateTime? selectedDateFromPicker = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (selectedDateFromPicker != null) {
      selectedDate.value = selectedDateFromPicker;
    }
  }

  Future<void> readAirportsJson() async {
    final String response = await rootBundle.loadString('assets/airports.json');
    final data = await json.decode(response);
    print(data);
  }
}
