import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/register/register_controller.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_controller.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_date_picker/input_field_date_picker.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_date_picker_register.dart';
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
        resizeToAvoidBottomInset: true,
        body: Form(
          key: controller.formKey,
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Let's get started",
                          style: kTitleScreenTextStyle,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 85.0,
                          ),
                          child: Text(
                            'Fill out a few details to get signed up',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'First name',
                                style: kHeaderFieldTextStyle,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              InputField(
                                textCapitalization:
                                    TextCapitalization.sentences,
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
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Last name',
                                style: kHeaderFieldTextStyle,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              InputField(
                                textCapitalization:
                                    TextCapitalization.sentences,
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
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Date of birth',
                                style: kHeaderFieldTextStyle,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              InputFieldDatePickerRegister(
                                isBirthday: true,
                                textEditingController: TextEditingController(),
                                labelText: "Date of birth",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Username',
                                style: kHeaderFieldTextStyle,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              InputField(
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  controller: Get.put(
                                    InputFieldController(),
                                    tag: "register_screen_userName",
                                  ),
                                  textInputAction: TextInputAction.next,
                                  labelText: 'Username',
                                  onInputFieldChanged:
                                      controller.onNameInputChanged,
                                  validator: isValidName,
                                  textInputType: TextInputType.text,
                                  textEditingController:
                                      controller.userNameTextController),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Email',
                                style: kHeaderFieldTextStyle,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              InputField(
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
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Password',
                                style: kHeaderFieldTextStyle,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              InputField(
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
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Confirm password',
                                style: kHeaderFieldTextStyle,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              InputField(
                                textCapitalization:
                                    TextCapitalization.sentences,
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Image.asset(
                        kPlane,
                        height: 50,
                        width: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                bottom: 10.0,
                              ),
                              child: Obx(
                                () => CustomButton(
                                  onTap: controller.isButtonEnabled.value
                                      ? controller.registerUser
                                      : null,
                                  text: controller.loginText,
                                  backgroundColor:
                                      controller.isButtonEnabled.value
                                          ? const Color(0xFF7B94FF)
                                          : kGeneralColor.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
