import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/dashboard/dashboard_screen.dart';
import 'package:travel_app/ui/register/register_screen.dart';
import 'package:travel_app/utils/constants/validator.dart';
import 'package:travel_app/utils/network/amadeus_api/authorization/authorization.dart';
import 'package:travel_app/utils/network/amadeus_api/authorization/authorization_response.dart';
import 'package:travel_app/utils/network/authentication.dart';
import 'package:travel_app/utils/session_temp.dart';

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
    isButtonEnabled.value = isValidEmail(emailTextController.text) == null &&
        isValidPassword(passwordTextController.text) == null;
  }

  void goToRegisterScreen() {
    Get.to(
      () => RegisterScreen(),
    );
  }

  void printText() {
    // Get.to(const DashboardScreen());
    // if (formKey.currentState!.validate()) {
    //   Authentication()
    //       .signInWithEmailAndPassword(
    //         email: emailTextController.text,
    //         password: passwordTextController.text,
    //       )
    //       .then((value) => {
    //           });
    // }

    if (formKey.currentState!.validate()) {
      Authorization().authorize().then(
            (value) => {
              if (value.statusCode == 200)
                {
                  print(
                    (value as AuthorizationResponse)
                        .authorizationResponseModel
                        .accessToken,
                  ),
                  amadeusAccessToken =
                      value.authorizationResponseModel.accessToken,
                  Get.to(
                    () => const DashboardScreen(),
                  ),
                }
              else
                {
                  print("${value.statusCode} ${value.status}"),
                },
            },
          );
    }
  }
}
