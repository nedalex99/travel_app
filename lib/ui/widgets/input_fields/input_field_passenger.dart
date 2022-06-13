import 'package:flutter/material.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_controller.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/typedefs.dart';

class InputFieldPassenger extends StatelessWidget {
  final InputFieldController? controller;
  final TextEditingController textEditingController;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final Validator validator;
  final String labelText;
  final OnInputFieldChanged onInputFieldChanged;

  const InputFieldPassenger({
    Key? key,
    this.controller,
    required this.textCapitalization,
    required this.textInputType,
    required this.textInputAction,
    required this.validator,
    required this.labelText,
    required this.onInputFieldChanged,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      autocorrect: false,
      textCapitalization: textCapitalization,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: textInputAction,
      obscureText: textInputType == TextInputType.visiblePassword
          ? controller!.isVisible.value
          : false,
      onChanged: onInputFieldChanged,
      validator: validator,
      style: TextStyle(
        color: Colors.black.withOpacity(0.75),
        fontSize: 14.0,
      ),
      decoration: InputDecoration(
        errorStyle: const TextStyle(
          color: kRedErrorField,
        ),
        hintText: labelText,
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
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
        prefixIcon: const Icon(
          Icons.person,
        ),
      ),
    );
  }
}
