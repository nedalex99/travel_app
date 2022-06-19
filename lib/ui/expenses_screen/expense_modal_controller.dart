import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ExpenseModalController extends GetxController {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController amountTextEditingController = TextEditingController();

  void onNameInputChanged(String value) {
    nameTextEditingController.text = value;
  }

  void onAmountInputChanged(String value) {
    amountTextEditingController.text = value;
  }
}
