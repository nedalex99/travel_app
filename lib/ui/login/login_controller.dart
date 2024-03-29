import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/change_password/change_password_screen.dart';
import 'package:travel_app/ui/city_screen/city_screen.dart';
import 'package:travel_app/ui/dashboard/dashboard_screen.dart';
import 'package:travel_app/ui/forgot_password/forgot_password_screen.dart';
import 'package:travel_app/ui/profile/user_profile.dart';
import 'package:travel_app/ui/register/register_screen.dart';
import 'package:travel_app/ui/widgets/dialogs/loading_dialog.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';
import 'package:travel_app/utils/constants/validator.dart';
import 'package:travel_app/utils/network/amadeus_api/authorization/authorization.dart';
import 'package:travel_app/utils/network/amadeus_api/authorization/authorization_response.dart';
import 'package:travel_app/utils/network/firebase/authentication/authentication.dart';
import 'package:travel_app/utils/network/firebase/authentication/sign_in_response.dart';
import 'package:travel_app/utils/session_temp.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  dynamic data;

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

  void goToChangePasswordScreen() {
    Get.to(
      () => ForgotPasswordScreen(),
    );
  }

  Future<void> getCitiesForUser() async {
    await FirebaseFirestore.instance
        .collection('selected-cities')
        .doc(userLoggedIn.uid)
        .get()
        .then<dynamic>((DocumentSnapshot snapshot) async {
      data = snapshot.data();
    });
  }

  void printText() {
    if (formKey.currentState!.validate()) {
      Get.dialog(
        const LoadingDialog(),
        barrierDismissible: false,
      );
      Authentication()
          .signInWithEmailAndPassword(
              email: emailTextController.text,
              password: passwordTextController.text)
          .then(
            (value) => {
              if (value.statusCode == 200)
                {
                  userLoggedIn = (value as SignInResponse).user,
                  Authorization().authorize().then(
                        (value) => {
                          if (value.statusCode == 200)
                            {
                              amadeusAccessToken =
                                  (value as AuthorizationResponse)
                                      .authorizationResponseModel
                                      .accessToken,
                              if (Authentication().findNewUser())
                                {
                                  Get.back(),
                                  Get.to(
                                    () => UserProfile(),
                                  ),
                                }
                              else
                                {
                                  Get.back(),
                                  FirebaseFirestore.instance
                                      .collection('selected-cities')
                                      .doc(userLoggedIn.uid)
                                      .get()
                                      .then(
                                    (value) {
                                      if (value.exists) {
                                        getCitiesForUser().then(
                                          (value) => Get.to(
                                            () => DashboardScreen(
                                              cityOne: data['city1'],
                                              cityTwo: data['city2'],
                                              cityThree: data['city3'],
                                            ),
                                          ),
                                        );
                                      } else {
                                        Get.off(
                                          () => ChooseCity(),
                                        );
                                      }
                                    },
                                  ),
                                }
                            }
                        },
                      )
                },
            },
          );
    }
  }
}
