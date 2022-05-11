import 'package:flutter/material.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_date_picker/input_field_date_picker_controller.dart';
import 'package:get/get.dart';

class InputFieldDatePicker extends StatelessWidget {
  late final InputFieldDatePickerController _controller;

  final String text;

  InputFieldDatePicker({
    Key? key,
    required this.text,
  }) : super(key: key) {
    _controller = Get.put(
      InputFieldDatePickerController(
        textController: TextEditingController()..text = text,
      ),
      tag: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      onTap: _controller.getDate,
      controller: _controller.textController,
      decoration: InputDecoration(
        fillColor: Colors.white,
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
