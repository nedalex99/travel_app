import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/widgets/dialogs/loading_dialog.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';
import 'package:travel_app/utils/constants/validator.dart';
import 'package:travel_app/utils/network/firebase/firestore/users_collection.dart';

class ChangePasswordController extends GetxController {
  RxBool isButtonEnabled = false.obs;
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController =
      TextEditingController();

  void onInputChanged(String value) {
    isButtonEnabled.value =
        isValidPassword(passwordTextController.text) == null &&
            isValidPassword(confirmPasswordTextController.text) == null;
  }

  void onConfirmPasswordInputChange(String value) {
    isButtonEnabled.value = confirmPassword(passwordTextController.text,
                confirmPasswordTextController.text) ==
            null &&
        isValidPassword(passwordTextController.text) == null;
  }

  Future<void> updatePassword() async {
    try {
      Get.dialog(
        const LoadingDialog(),
      );
      if (confirmPassword(passwordTextController.text,
              confirmPasswordTextController.text) !=
          null) {
        Get.back();
        Get.defaultDialog(
          title: "Fail!",
          middleText: "Password does not match.",
          backgroundColor: kGeneralColor,
          titleStyle: kNormalTextStyle,
          radius: 10,
        );
      } else {
        await UsersCollection()
            .updatePassword(newPass: passwordTextController.text)
            .then((value) => {
                  Get.back(),
                  Get.defaultDialog(
                    title: "Success!",
                    middleText: "Your password has been modified.",
                    backgroundColor: kGeneralColor,
                    titleStyle: kNormalTextStyle,
                    radius: 10,
                  ),
                });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
