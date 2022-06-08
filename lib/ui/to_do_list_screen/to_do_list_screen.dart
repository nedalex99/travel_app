import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/to_do_list_screen/components/trips_card_to_do.dart';
import 'package:travel_app/ui/to_do_list_screen/to_do_list_controller.dart';
import 'package:travel_app/utils/constants/colors.dart';

class ToDoListScreen extends StatelessWidget {
  ToDoListScreen({Key? key}) : super(key: key);
  final ToDoListController toDoListController = Get.put(ToDoListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text(
              "To dos",
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.black87,
              ),
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
                          text: toDoListController
                              .trips[index].flightCardDetails.arrivalCity!,
                          onClick: () {
                            toDoListController.redirectListToDoScreen(
                                toDoListController.trips[index]
                                    .flightCardDetails.arrivalCity!);
                          },
                        ),
                      ],
                    ),
                  );
                },
                childCount: toDoListController.trips.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
