import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/dashboard/dashboard_screen.dart';
import 'package:travel_app/utils/constants/validator.dart';
import 'package:travel_app/utils/network/authentication.dart';

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
    Get.to(const DashboardScreen());
    if (formKey.currentState!.validate()) {
      Authentication()
          .signInWithEmailAndPassword(
            email: emailTextController.text,
            password: passwordTextController.text,
          )
          .then((value) => {
              });
    }
  }
}
