import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/utils/constants/validator.dart';

class AccountInformationController extends GetxController {
  RxBool isButtonEnabled = false.obs;
  final TextEditingController firstNameTextController = TextEditingController();


  void onFirstNameInputChanged(String value) {
    isButtonEnabled.value = isValidName(firstNameTextController.text) == null;
  }

}
