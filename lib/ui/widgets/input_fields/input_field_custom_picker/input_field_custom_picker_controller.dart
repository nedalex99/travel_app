import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:get/get.dart';

class InputFieldCustomPickerController extends GetxController {
  TextEditingController textController;

  InputFieldCustomPickerController({
    required this.textController,
  });

  Future<void> showPicker() async {
    var selected = await showMaterialScrollPicker<String>(
      context: Get.context!,
      items: ["Male", "Female"],
      selectedItem: "Male",
    );
    if (selected != null) {
      textController.text = selected;
    }
  }
}
