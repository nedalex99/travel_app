import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_custom_picker/input_field_custom_picker_controller.dart';
import 'package:travel_app/utils/constants/colors.dart';

class InputFieldCustomPicker extends StatelessWidget {
  late final InputFieldCustomPickerController _controller;
  final String text;
  final TextEditingController textEditingController;

  InputFieldCustomPicker({
    Key? key,
    required this.text,
    required this.textEditingController,
  }) : super(key: key) {
    _controller = Get.put(
      InputFieldCustomPickerController(
        textController: textEditingController,
      ),
      tag: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      onTap: _controller.showPicker,
      controller: _controller.textController,
      decoration: InputDecoration(
        fillColor: kGeneralColor.withOpacity(0.3),
        filled: true,
        contentPadding: const EdgeInsets.all(
          8,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              6,
            ),
          ),
        ),
        labelText: text,
      ),
    );
  }
}
