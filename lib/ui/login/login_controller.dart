import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/register/register_screen.dart';
import 'package:travel_app/utils/constants/validator.dart';

class LoginController extends GetxController {
  String loginText = "In Login screen";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  RxBool isButtonEnabled = false.obs;

  void onEmailInputChanged(String value) {
    isButtonEnabled.value = isValidEmail(emailTextController.text) == null &&
        isValidPassword(passwordTextController.text) == null;
  }

  void onPasswordInputChanged(String value) {
    isButtonEnabled.value = isValidPassword(emailTextController.text) == null &&
        isValidEmail(passwordTextController.text) == null;
  }

  void goToRegisterScreen() {
    Get.to(
      () => RegisterScreen(),
    );
  }

  void printText() {
    if (!formKey.currentState!.validate()) {
      isButtonEnabled.value = false;
    } else {
      isButtonEnabled.value = true;
    }
  }
}
