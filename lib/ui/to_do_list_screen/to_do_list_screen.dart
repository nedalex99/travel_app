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
      // appBar: AppBar(
      //   backgroundColor: kGeneralColor.withOpacity(0.5),
      //   elevation: 3,
      //   leading: const BackButton(
      //     color: Colors.black,
      //   ),
      //   title: const Text(
      //     "TO DOS ",
      //     style: TextStyle(
      //       color: Colors.black,
      //     ),
      //   ),
      // ),
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
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TripCardToDo(
                      //flightTicket: toDoListController.trips[index],
                      text: "Barcelona",
                      onClick: toDoListController.redirectListToDoScreen,
                    ),
                    TripCardToDo(
                      //flightTicket: toDoListController.trips[index],
                      text: "Paris",
                      onClick: toDoListController.redirectListToDoScreen,
                    ),
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
