import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/change_password/change_password_controller.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_controller.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';
import 'package:travel_app/utils/constants/validator.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  final ChangePasswordController controller = ChangePasswordController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kGeneralColor.withOpacity(0.5),
          elevation: 3,
          leading: const BackButton(
            color: Colors.black,
          ),
          title: const Text(
            "Change Password",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'New Password',
                    style: kHeaderFieldTextStyle,
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  InputField(
                    labelText: 'Enter your new password',
                    textInputType: TextInputType.visiblePassword,
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.next,
                    validator: isValidPassword,
                    textEditingController: controller.passwordTextController,
                    onInputFieldChanged: controller.onInputChanged,
                    controller: Get.put(
                      InputFieldController(),
                      tag: "change_new_pass",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Confirm new Password',
                    style: kHeaderFieldTextStyle,
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  InputField(
                    labelText: 'Enter your new password',
                    textInputType: TextInputType.visiblePassword,
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.done,
                    validator: isValidPassword,
                    textEditingController:
                        controller.confirmPasswordTextController,
                    onInputFieldChanged:
                        controller.onConfirmPasswordInputChange,
                    controller: Get.put(
                      InputFieldController(),
                      tag: "change_new_pass_confirm",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Obx(
                      () => CustomButton(
                        onTap: () {
                          controller.updatePassword();
                        },
                        text: 'Updated Password',
                        backgroundColor: controller.isButtonEnabled.value
                            ? const Color(0xFF7B94FF)
                            : kGeneralColor.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
