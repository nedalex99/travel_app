import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/login/login_screen.dart';
import 'package:travel_app/utils/constants/validator.dart';
import 'package:travel_app/utils/network/authentication.dart';

class RegisterController extends GetxController {
  String loginText = "Register";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController =
      TextEditingController();
  final TextEditingController firstNameTextController = TextEditingController();
  final TextEditingController lastNameTextController = TextEditingController();
  final TextEditingController userNameTextController = TextEditingController();

  RxBool isButtonEnabled = false.obs;

  void onNameInputChanged(String value) {
    isButtonEnabled.value = isValidName(firstNameTextController.text) == null &&
        isValidPassword(passwordTextController.text) == null &&
        isValidName(lastNameTextController.text) == null &&
        isValidEmail(emailTextController.text) == null;
  }

  void onEmailInputChanged(String value) {
    isButtonEnabled.value = isValidEmail(emailTextController.text) == null &&
        isValidPassword(passwordTextController.text) == null &&
        isValidName(firstNameTextController.text) == null &&
        isValidName(lastNameTextController.text) == null;
  }

  void onPasswordInputChanged(String value) {
    isButtonEnabled.value =
        isValidPassword(passwordTextController.text) == null &&
            isValidName(firstNameTextController.text) == null &&
            isValidName(lastNameTextController.text) == null &&
            isValidEmail(emailTextController.text) == null &&
            confirmPassword(passwordTextController.text,
                    confirmPasswordTextController.text) ==
                null;
  }

  void onConfirmPasswordInputChange(String value) {
    isButtonEnabled.value = confirmPassword(passwordTextController.text,
                confirmPasswordTextController.text) ==
            null &&
        isValidPassword(passwordTextController.text) == null &&
        isValidName(firstNameTextController.text) == null &&
        isValidName(lastNameTextController.text) == null &&
        isValidEmail(emailTextController.text) == null;
  }

  void printText() {
    if (formKey.currentState!.validate()) {
      try {
        Authentication()
            .registerUser(
                name: firstNameTextController.text,
                firstName: lastNameTextController.text,
                userName: userNameTextController.text,
                email: emailTextController.text,
                password: passwordTextController.text)
            .then((value) => Get.back());
      } catch (e) {
        print(e.toString());
      }
    } else {}
  }
}
