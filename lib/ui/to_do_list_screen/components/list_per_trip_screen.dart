import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/to_do_list_screen/components/list_to_do_controller.dart';
import 'package:travel_app/ui/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/utils/constants/colors.dart';

class ListPerTripScreen extends StatelessWidget {
  ListPerTripScreen({Key? key}) : super(key: key);
  ListPerTripController listPerTripController =
      Get.put(ListPerTripController());

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
            "TO DOD FOR TITLE",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Column(
                  children: [
                    listPerTripController.list.length == 0
                        ? const Text("LIST TO DO")
                        : const Text("AI TO DO"),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 80,
                        bottom: 20,
                      ),
                      child: CustomButton(
                        onTap: listPerTripController.redirectAddToDoScreen,
                        text: "Create a note",
                        backgroundColor: kGeneralColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBarWidget(),
      ),
    );
  }
}
