import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/register/register_controller.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field.dart';
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
        child: Padding(
          padding: const EdgeInsets.only(
            top: 64.0,
          ),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Register',
                      ),
                      const SizedBox(
                        height: 130,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: InputField(
                          textCapitalization: TextCapitalization.sentences,
                          textEditingController: controller.nameTextController,
                          textInputAction: TextInputAction.next,
                          labelText: 'Name',
                          onInputFieldChanged: controller.onNameInputChanged,
                          validator: isValidName,
                          textInputType: TextInputType.text,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: InputField(
                          textCapitalization: TextCapitalization.sentences,
                          textEditingController:
                              controller.firstNameTextController,
                          textInputAction: TextInputAction.next,
                          labelText: 'First Name',
                          onInputFieldChanged: controller.onNameInputChanged,
                          validator: isValidName,
                          textInputType: TextInputType.text,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: InputField(
                          textCapitalization: TextCapitalization.sentences,
                          textEditingController: controller.emailTextController,
                          textInputAction: TextInputAction.next,
                          labelText: 'Email',
                          onInputFieldChanged: controller.onEmailInputChanged,
                          validator: isValidEmail,
                          textInputType: TextInputType.text,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: InputField(
                          textCapitalization: TextCapitalization.sentences,
                          textEditingController:
                              controller.passwordTextController,
                          textInputAction: TextInputAction.done,
                          validator: isValidPassword,
                          textInputType: TextInputType.visiblePassword,
                          onInputFieldChanged:
                              controller.onPasswordInputChanged,
                          labelText: 'Password',
                        ),
                      ),
                    ],
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
      ),
    );
  }
}
