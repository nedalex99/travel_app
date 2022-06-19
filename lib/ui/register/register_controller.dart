import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/user_model.dart';
import 'package:travel_app/ui/widgets/dialogs/loading_dialog.dart';
import 'package:travel_app/utils/constants/validator.dart';
import 'package:travel_app/utils/network/firebase/authentication/authentication.dart';
import 'package:travel_app/utils/network/firebase/authentication/sign_in_response.dart';
import 'package:travel_app/utils/network/firebase/firestore/users_collection.dart';

class RegisterController extends GetxController {
  String loginText = "REGISTER";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController =
      TextEditingController();
  final TextEditingController firstNameTextController = TextEditingController();
  final TextEditingController lastNameTextController = TextEditingController();
  final TextEditingController userNameTextController = TextEditingController();
  final TextEditingController dateOfBirthTextController =
      TextEditingController();

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

  Future<void> registerUser() async {
    if (formKey.currentState!.validate()) {
      try {
        Get.dialog(
          const LoadingDialog(),
        );
        UserModel userModel = UserModel(
          lastName: lastNameTextController.text,
          firstName: firstNameTextController.text,
          userName: userNameTextController.text,
          email: emailTextController.text,
          dateOfBirth: dateOfBirthTextController.text,
        );
        await Authentication()
            .registerUser(
              lastName: lastNameTextController.text,
              firstName: firstNameTextController.text,
              userName: userNameTextController.text,
              email: emailTextController.text,
              password: passwordTextController.text,
            )
            .then(
              (value) => {
                userModel.uid = (value as SignInResponse).user.uid,
                UsersCollection()
                    .addUser(
                      userModel: userModel,
                    )
                    .then(
                      (value) => {
                        Get.back(),
                        Get.back(),
                      },
                    ),
              },
            );
      } catch (e) {
        print(e.toString());
      }
    } else {}
  }
}
