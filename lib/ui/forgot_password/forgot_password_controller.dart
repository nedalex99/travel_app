import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/widgets/dialogs/loading_dialog.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';
import 'package:travel_app/utils/constants/validator.dart';
import 'package:travel_app/utils/network/firebase/firestore/users_collection.dart';

class ForgotPasswordController extends GetxController {
  RxBool isButtonEnabled = false.obs;
  final TextEditingController emailTextController = TextEditingController();

  void onInputChanged(String value) {
    isButtonEnabled.value = isValidEmail(emailTextController.text) == null;
  }

  Future<void> changePassword() async {
    try {
      Get.dialog(
        const LoadingDialog(),
      );
      await UsersCollection()
          .changePassword(email: emailTextController.text.trim())
          .then((value) => {
                Get.back(),
                Get.defaultDialog(
                  title: "Success!",
                  middleText: "An email has been sent to change your password.",
                  backgroundColor: kGeneralColor,
                  titleStyle: kNormalTextStyle,
                  radius: 10,
                ),
              });
    } catch (e) {
      print(e.toString());
    }
  }
}
