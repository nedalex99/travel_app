import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/login/login_controller.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_controller.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/images.dart';
import 'package:travel_app/utils/constants/strings.dart';
import 'package:travel_app/utils/constants/styles.dart';
import 'package:travel_app/utils/constants/validator.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: const TextSpan(
                              text: kApplicationName,
                              style: kTitleTextStyle,
                              children: [
                                TextSpan(
                                  text: kApplicationNameTwo,
                                  style: kTitleColoredTextStyle,
                                ),
                                TextSpan(
                                  text: kApplicationNameThree,
                                  style: kTitleTextStyle,
                                ),
                              ]),
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: InputField(
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.next,
                            labelText: 'Email',
                            textInputType: TextInputType.text,
                            onInputFieldChanged: controller.onEmailInputChanged,
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
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: InputField(
                              textCapitalization: TextCapitalization.sentences,
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 50.0,
                        left: 70.0,
                      ),
                      child: Obx(
                        () => CustomButton(
                          onTap: controller.isButtonEnabled.value
                              ? controller.printText
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
                  right: 200,
                ),
                child: Image.asset(
                  kPlane,
                  height: 200,
                  width: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
