import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/register/register_controller.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_controller.dart';
import 'package:travel_app/utils/constants/validator.dart';

class RegisterScreen extends StatelessWidget {
  final controller = Get.put(RegisterController());

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFFAF0),
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
                          const Text(
                            'Register',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: InputField(
                              textCapitalization: TextCapitalization.sentences,
                              controller: Get.put(
                                InputFieldController(),
                                tag: "register_screen_firstName",
                              ),
                              textInputAction: TextInputAction.next,
                              labelText: 'First Name',
                              onInputFieldChanged:
                                  controller.onNameInputChanged,
                              validator: isValidName,
                              textInputType: TextInputType.text,
                              textEditingController:
                                  controller.firstNameTextController,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: InputField(
                              textCapitalization: TextCapitalization.sentences,
                              controller: Get.put(
                                InputFieldController(),
                                tag: "register_screen_lastName",
                              ),
                              textInputAction: TextInputAction.next,
                              labelText: 'Last Name',
                              onInputFieldChanged:
                                  controller.onNameInputChanged,
                              validator: isValidName,
                              textInputType: TextInputType.text,
                              textEditingController:
                                  controller.lastNameTextController,
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
                                  tag: "register_screen_userName",
                                ),
                                textInputAction: TextInputAction.next,
                                labelText: 'User Name',
                                onInputFieldChanged:
                                    controller.onNameInputChanged,
                                validator: isValidName,
                                textInputType: TextInputType.text,
                                textEditingController:
                                    controller.userNameTextController),
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
                                  tag: "register_screen_email",
                                ),
                                textInputAction: TextInputAction.next,
                                labelText: 'Email',
                                onInputFieldChanged:
                                    controller.onEmailInputChanged,
                                validator: isValidEmail,
                                textInputType: TextInputType.text,
                                textEditingController:
                                    controller.emailTextController),
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
                                textInputAction: TextInputAction.next,
                                validator: isValidPassword,
                                textInputType: TextInputType.visiblePassword,
                                onInputFieldChanged:
                                    controller.onPasswordInputChanged,
                                labelText: 'Password',
                                textEditingController:
                                    controller.passwordTextController),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: InputField(
                              textCapitalization: TextCapitalization.sentences,
                              controller: Get.put(
                                InputFieldController(),
                                tag: "register_screen_confirm_password",
                              ),
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              onInputFieldChanged:
                                  controller.onConfirmPasswordInputChange,
                              labelText: 'Confirm Password',
                              textEditingController:
                                  controller.confirmPasswordTextController,
                              validator: isValidPassword,
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
                            ? Colors.blue
                            : Colors.yellow,
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
