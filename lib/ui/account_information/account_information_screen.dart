import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/account_information/account_infromation_controller.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_controller.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/validator.dart';

class AccountInformationScreen extends StatelessWidget {
  AccountInformationScreen({Key? key}) : super(key: key);
  AccountInformationController controller =
      Get.put(AccountInformationController());

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
            "Account Information",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.network(
                'https://icons.veryicon.com/png/o/miscellaneous/two-color-icon-library/user-286.png',
                width: 100,
                height: 100,
                fit: BoxFit.fill,
              ),
              InputField(
                labelText: "First Name",
                textInputType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.next,
                validator: isValidName,
                textEditingController: controller.firstNameTextController,
                onInputFieldChanged: controller.onFirstNameInputChanged,
                controller: Get.put(
                  InputFieldController(),
                  tag: "register_screen_email",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
