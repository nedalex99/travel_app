import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/to_do_list_screen/components/trips_card_to_do.dart';
import 'package:travel_app/ui/to_do_list_screen/to_do_list_controller.dart';
import 'package:travel_app/utils/constants/colors.dart';

class ToDoListScreen extends StatelessWidget {
  ToDoListScreen({Key? key}) : super(key: key);
  final ToDoListController toDoListController = ToDoListController();

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
            "TO DOS ",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TripsCard(
                      onClick: toDoListController.redirectListToDoScreen,
                      text: "Calatorie ",
                    ),
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
