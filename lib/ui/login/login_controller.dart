import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_app/utils/constants/validator.dart';

class LoginController extends GetxController {
  String loginText = "In Login screen";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  RxBool isButtonEnabled = false.obs;

  void onEmailInputChanged(String value) {
    isButtonEnabled.value = isValidName(emailTextController.text) == null &&
        isValidName(passwordTextController.text) == null;
  }

  void onPasswordInputChanged(String value) {
    isButtonEnabled.value = isValidName(emailTextController.text) == null &&
        isValidName(passwordTextController.text) == null;
  }

  void printText() {
    if (!formKey.currentState!.validate()) {
      isButtonEnabled.value = false;
    } else {
      isButtonEnabled.value = true;
    }
  }
}
