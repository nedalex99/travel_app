import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/ui/expenses_screen/expenses_screen_controller.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/utils/constants/colors.dart';

class TransactionsScreen extends StatelessWidget {
  TransactionsScreen({
    Key? key,
    required this.flightTicket,
  }) : super(key: key) {
    controller = Get.put(
      TransactionsScreenController(
        trip: flightTicket,
      ),
    );
  }

  late TransactionsScreenController controller;
  final FlightTicket flightTicket;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: Text(
          'Add expense for ${flightTicket.flightCardDetails.arrivalCity}',
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Available budget: ',
                            style: TextStyle(
                              color: Colors.black.withOpacity(
                                0.75,
                              ),
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                            text: '${controller.budgetRemaining.value}\$',
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            6,
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFe6e6e6),
                            spreadRadius: 1,
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(
                        8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.transactions[index].transactionName,
                            style: const TextStyle(
                              fontSize: 24.0,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "-${controller.transactions[index].sum}",
                            style: const TextStyle(
                              fontSize: 24.0,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: controller.transactions.length,
              ),
            ),
          ),
          SliverFillRemaining(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 24.0,
                ),
                child: CustomButton(
                  backgroundColor: kGeneralColor,
                  onTap: controller.showAddExpenseModal,
                  text: 'Add expense',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
