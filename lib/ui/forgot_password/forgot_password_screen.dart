import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/forgot_password/forgot_password_controller.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_controller.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';
import 'package:travel_app/utils/constants/validator.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final ForgotPasswordController controller = ForgotPasswordController();

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
                    'E-mail',
                    style: kHeaderFieldTextStyle,
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  InputField(
                    labelText: 'Enter your e-mail',
                    textInputType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.next,
                    validator: isValidEmail,
                    textEditingController: controller.emailTextController,
                    onInputFieldChanged: controller.onInputChanged,
                    controller: Get.put(
                      InputFieldController(),
                      tag: "change_email",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Obx(
                      () => CustomButton(
                        onTap: () {
                          controller.changePassword();
                        },
                        text: 'Send e-mail',
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
