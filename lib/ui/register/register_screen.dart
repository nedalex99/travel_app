import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/register/register_controller.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_controller.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/images.dart';
import 'package:travel_app/utils/constants/styles.dart';
import 'package:travel_app/utils/constants/validator.dart';

class RegisterScreen extends StatelessWidget {
  final controller = Get.put(RegisterController());

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: controller.formKey,
          child: Scrollbar(
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            'REGISTER',
                            style: kTitleScreenTextStyle,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24.0),
                            child: InputField(
                              textCapitalization: TextCapitalization.sentences,
                              controller: Get.put(
                                InputFieldController(),
                                tag: "register_screen_firstName",
                              ),
                              textInputAction: TextInputAction.next,
                              labelText: 'First Name',
                              onInputFieldChanged: controller.onNameInputChanged,
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
                            padding: const EdgeInsets.symmetric(horizontal: 24.0),
                            child: InputField(
                              textCapitalization: TextCapitalization.sentences,
                              controller: Get.put(
                                InputFieldController(),
                                tag: "register_screen_lastName",
                              ),
                              textInputAction: TextInputAction.next,
                              labelText: 'Last Name',
                              onInputFieldChanged: controller.onNameInputChanged,
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
                            padding: const EdgeInsets.symmetric(horizontal: 24.0),
                            child: InputField(
                                textCapitalization: TextCapitalization.sentences,
                                controller: Get.put(
                                  InputFieldController(),
                                  tag: "register_screen_userName",
                                ),
                                textInputAction: TextInputAction.next,
                                labelText: 'User Name',
                                onInputFieldChanged: controller.onNameInputChanged,
                                validator: isValidName,
                                textInputType: TextInputType.text,
                                textEditingController:
                                    controller.userNameTextController),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24.0),
                            child: InputField(
                                textCapitalization: TextCapitalization.sentences,
                                controller: Get.put(
                                  InputFieldController(),
                                  tag: "register_screen_email",
                                ),
                                textInputAction: TextInputAction.next,
                                labelText: 'Email',
                                onInputFieldChanged: controller.onEmailInputChanged,
                                validator: isValidEmail,
                                textInputType: TextInputType.text,
                                textEditingController:
                                    controller.emailTextController),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24.0),
                            child: InputField(
                                textCapitalization: TextCapitalization.sentences,
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
                            padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10.0,
                          left: 70.0,
                        ),
                        child: Obx(
                          () => CustomButton(
                            onTap: controller.isButtonEnabled.value
                                ? controller.registerUser
                                : null,
                            text: controller.loginText,
                            backgroundColor: controller.isButtonEnabled.value
                                ? const Color(0xFF7B94FF)
                                : kGeneralColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 300,
                  ),
                  child: Image.asset(
                    kPlane,
                    height: 100,
                    width: 200,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
