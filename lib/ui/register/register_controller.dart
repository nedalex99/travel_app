import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/register/register_screen.dart';
import 'package:travel_app/utils/constants/validator.dart';

class RegisterController extends GetxController {
  String loginText = "Register";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController firstNameTextController = TextEditingController();

  RxBool isButtonEnabled = false.obs;


  void onNameInputChanged(String value) {
    isButtonEnabled.value = isValidName(nameTextController.text) == null &&
        isValidPassword(passwordTextController.text) == null &&
            isValidName(firstNameTextController.text) == null &&
            isValidEmail(emailTextController.text) == null;
  }

  void onEmailInputChanged(String value) {
    isButtonEnabled.value = isValidEmail(emailTextController.text) == null &&
        isValidPassword(passwordTextController.text) == null &&
        isValidName(nameTextController.text) == null &&
        isValidName(firstNameTextController.text) == null;
  }

  void onPasswordInputChanged(String value) {
    isButtonEnabled.value =
        isValidPassword(passwordTextController.text) == null &&
            isValidName(nameTextController.text) == null &&
            isValidName(firstNameTextController.text) == null &&
            isValidEmail(emailTextController.text) == null;
  }

  void printText() {
    if (!formKey.currentState!.validate()) {
      isButtonEnabled.value = false;
    } else {
      isButtonEnabled.value = true;
    }
  }
}
