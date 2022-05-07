import 'package:flutter/material.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/typedefs.dart';

class InputField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final Validator validator;
  final String labelText;
  final OnInputFieldChanged onInputFieldChanged;

  const InputField({
    Key? key,
    required this.textEditingController,
    required this.textCapitalization,
    required this.textInputType,
    required this.textInputAction,
    required this.validator,
    required this.labelText,
    required this.onInputFieldChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      autocorrect: false,
      textCapitalization: textCapitalization,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: textInputAction,
      obscureText:
          textInputType == TextInputType.visiblePassword ? true : false,
      onChanged: onInputFieldChanged,
      validator: validator,
      decoration: InputDecoration(
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
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: kRedErrorField,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              6,
            ),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: kRedErrorField,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              6,
            ),
          ),
        ),
        errorStyle: const TextStyle(
          color: kRedErrorField,
        ),
        labelText: labelText,
      ),
    );
  }
}
