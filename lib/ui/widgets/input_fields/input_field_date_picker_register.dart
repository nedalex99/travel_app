import 'package:flutter/material.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_date_picker/input_field_date_picker_controller.dart';
import 'package:get/get.dart';
import 'package:travel_app/utils/constants/colors.dart';

class InputFieldDatePickerRegister extends StatelessWidget {
  late final InputFieldDatePickerController _controller;

  final String? text;
  final String labelText;
  final bool isBirthday;
  final TextEditingController textEditingController;

  InputFieldDatePickerRegister({
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
      style: TextStyle(
        color: Colors.black.withOpacity(0.75),
        fontSize: 14.0,
      ),
      decoration: InputDecoration(
        errorStyle: const TextStyle(
          color: kRedErrorField,
        ),
        hintText: labelText,
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.4),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black26,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black54,
          ),
        ),
        disabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
