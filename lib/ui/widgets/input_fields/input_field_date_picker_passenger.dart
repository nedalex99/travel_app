import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_date_picker/input_field_date_picker_controller.dart';

class InputFieldDatePickerPassenger extends StatelessWidget {
  late final InputFieldDatePickerController _controller;

  final String? text;
  final String labelText;
  final bool isBirthday;
  final TextEditingController textEditingController;

  InputFieldDatePickerPassenger({
    Key? key,
    this.text,
    required this.textEditingController,
    required this.labelText,
    required this.isBirthday,
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
      onTap: () => _controller.getDate(isBirthday: isBirthday),
      controller: _controller.textController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(
          8,
        ),
        labelText: labelText,
        prefixIcon: const Icon(
          Icons.date_range,
        ),
      ),
    );
  }
}