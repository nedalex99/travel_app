import 'package:flutter/material.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_date_picker/input_field_date_picker_controller.dart';
import 'package:get/get.dart';
import 'package:travel_app/utils/constants/colors.dart';

class InputFieldDatePicker extends StatelessWidget {
  late final InputFieldDatePickerController _controller;

  final String? text;
  final String labelText;
  final TextEditingController textEditingController;

  InputFieldDatePicker({
    Key? key,
    this.text,
    required this.textEditingController,
    required this.labelText,
  }) : super(key: key) {
    if (text == null) {
      _controller = Get.put(
        InputFieldDatePickerController(
          textController: textEditingController,
        ),
        tag: labelText,
      );
    } else {
      _controller = Get.put(
        InputFieldDatePickerController(
          textController: TextEditingController()..text = text!,
        ),
        tag: labelText,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      onTap: _controller.getDate,
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
        labelText: labelText,
      ),
    );
  }
}
