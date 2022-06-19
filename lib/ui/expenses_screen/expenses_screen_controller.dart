import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/expense_model.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/ui/expenses_screen/expense_modal_controller.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/ui/widgets/dialogs/loading_dialog.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field.dart';
import 'package:travel_app/ui/widgets/input_fields/input_field_controller.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';
import 'package:travel_app/utils/constants/validator.dart';

class TransactionsScreenController extends GetxController {
  final FlightTicket trip;
  RxList<TransactionModel> transactions = <TransactionModel>[].obs;

  late int expenseSum;
  late String expenseName;
  RxInt budgetRemaining = 0.obs;

  TransactionsScreenController({
    required this.trip,
  });

  @override
  void onInit() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      budgetRemaining.value = trip.budget;
      getExpenses();
    });
    super.onInit();
  }

  Future<void> getExpenses() async {
    Get.dialog(
      LoadingDialog(),
    );
    FirebaseFirestore.instance
        .collection('trips')
        .doc(trip.id)
        .collection('transactions')
        .get()
        .then(
      (value) {
        value.docs.forEach((element) {
          var json = element.data();
          transactions.add(
            TransactionModel.fromJson(
              json,
            ),
          );
        });
        Get.back();
      },
    );
  }

  Future<void> addTransaction() async {
    Get.dialog(LoadingDialog());
    await FirebaseFirestore.instance
        .collection('trips')
        .doc(trip.id)
        .collection('transactions')
        .add(
          TransactionModel(
            transactionName: expenseName,
            sum: expenseSum,
          ).toJson(),
        )
        .then((value) async {
      await FirebaseFirestore.instance.collection('trips').doc(trip.id).update({
        'budget': FieldValue.increment(-expenseSum),
      }).then((value) {
        Get.back();
        Get.back();
        budgetRemaining.value -= expenseSum;
        transactions.insert(
          0,
          TransactionModel(
            transactionName: expenseName,
            sum: expenseSum,
          ),
        );
      });
    });
  }

  void showAddExpenseModal() {
    ExpenseModalController controller = Get.put(ExpenseModalController());
    showModalBottomSheet(
        context: Get.context!,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(
              16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Transaction name',
                      style: kHeaderFieldTextStyle,
                    ),
                    InputField(
                      textCapitalization: TextCapitalization.characters,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: isValidName,
                      controller: Get.put(
                        InputFieldController(),
                        tag: "name_controller",
                      ),
                      labelText: 'Transaction name',
                      onInputFieldChanged: (value) {
                        controller.onNameInputChanged;
                        expenseName = value;
                      },
                      textEditingController:
                          controller.nameTextEditingController,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Transaction amount',
                      style: kHeaderFieldTextStyle,
                    ),
                    InputField(
                      textCapitalization: TextCapitalization.characters,
                      textInputType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validator: isValidAmount,
                      labelText: 'Transaction amount',
                      controller: Get.put(
                        InputFieldController(),
                        tag: "amount_controller",
                      ),
                      onInputFieldChanged: (value) {
                        controller.amountTextEditingController;
                        expenseSum = int.tryParse(value)!;
                      },
                      textEditingController:
                          controller.amountTextEditingController,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                CustomButton(
                  onTap: addTransaction,
                  text: "Add transaction",
                  backgroundColor: kGeneralColor,
                ),
              ],
            ),
          );
        });
  }
}
