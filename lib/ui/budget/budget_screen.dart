import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/budget/budget_controller.dart';
import 'package:travel_app/ui/to_do_list_screen/components/trips_card_to_do.dart';
import 'package:travel_app/utils/constants/colors.dart';

class BudgetScreen extends StatelessWidget {
  late BudgetController controller = Get.put(BudgetController());

  BudgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text(
                "Budget",
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black87,
                ),
              ),
              leading: BackButton(
                color: Colors.black,
              ),
              backgroundColor: kGeneralColor,
            ),
            Obx(
              () => SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TripCardToDo(
                            text: controller
                                .trips[index].flightCardDetails.arrivalCity!,
                            onClick: () {
                              controller.redirectBudgetPerTripScreen(controller
                                  .trips[index]);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: controller.trips.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
