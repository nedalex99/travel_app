import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/login/login_controller.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_controller.dart';
import 'package:travel_app/utils/constants/validator.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: InputField(
                              textCapitalization: TextCapitalization.sentences,
                              textInputAction: TextInputAction.next,
                              labelText: 'Email',
                              textInputType: TextInputType.text,
                              onInputFieldChanged:
                                  controller.onEmailInputChanged,
                              validator: isValidEmail,
                              textEditingController:
                                  controller.emailTextController,
                              controller: Get.put(
                                InputFieldController(),
                                tag: "register_screen_email",
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: InputField(
                                textCapitalization:
                                    TextCapitalization.sentences,
                                controller: Get.put(
                                  InputFieldController(),
                                  tag: "register_screen_password",
                                ),
                                textInputAction: TextInputAction.done,
                                validator: isValidPassword,
                                textInputType: TextInputType.visiblePassword,
                                onInputFieldChanged:
                                    controller.onPasswordInputChanged,
                                labelText: 'Password',
                                textEditingController:
                                    controller.passwordTextController),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () => {
                              controller.goToRegisterScreen(),
                            },
                            child: const Text(
                              'Don\'t have an account? Sign up',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 24.0,
                    ),
                    child: Obx(
                      () => CustomButton(
                        onTap: controller.isButtonEnabled.value
                            ? controller.printText
                            : null,
                        text: controller.loginText,
                        backgroundColor: controller.isButtonEnabled.value
                            ? Colors.blueAccent
                            : Color(0x80000000),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
