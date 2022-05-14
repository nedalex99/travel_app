import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_controller.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/typedefs.dart';

class InputField extends StatelessWidget {
  final InputFieldController controller;
  final TextEditingController textEditingController;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final Validator validator;
  final String labelText;
  final OnInputFieldChanged onInputFieldChanged;

  const InputField({
    Key? key,
    required this.controller,
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
          ? controller.isVisible.value
          : false,
      onChanged: onInputFieldChanged,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
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
        suffixIcon: textInputType == TextInputType.visiblePassword
            ? Obx(
                () => GestureDetector(
                  onTap: () {
                    controller.isVisible.value = !controller.isVisible.value;
                  },
                  child: controller.isVisible.value
                      ? const Icon(
                          Icons.remove_red_eye,
                          color: Colors.black,
                          size: 20.0,
                        )
                      : const Icon(
                          Icons.visibility_off,
                          color: Colors.black,
                          size: 20.0,
                        ),
                ),
              )
            : null,
      ),
    );
  }
}
