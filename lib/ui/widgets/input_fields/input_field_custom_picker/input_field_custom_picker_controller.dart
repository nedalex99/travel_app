import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:get/get.dart';

class InputFieldCustomPickerController extends GetxController {
  TextEditingController textController;
  List<String> items;

  InputFieldCustomPickerController(
      {required this.textController, required this.items});

  Future<void> showPicker() async {
    var selected = await showMaterialScrollPicker<String>(
      context: Get.context!,
      items: items,
      selectedItem: items[0],
    );
    if (selected != null) {
      textController.text = selected;
    }
  }
}
