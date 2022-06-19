import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/to_do_list_screen/components/list_per_trip_controller.dart';
import 'package:travel_app/ui/to_do_list_screen/components/to_do_card.dart';
import 'package:travel_app/ui/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/ui/widgets/empty_widget.dart';
import 'package:travel_app/utils/constants/colors.dart';

class ListPerTripScreen extends StatelessWidget {
  final String nameTrip;

  ListPerTripScreen({
    Key? key,
    required this.nameTrip,
  }) : super(key: key) {
    listPerTripController = Get.put(
      ListPerTripController(
        nameTrip: nameTrip,
      ),
    );
  }

  late final ListPerTripController listPerTripController;

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
          title: Text(
            "To dos for $nameTrip",
            style: const TextStyle(
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
                    Obx(
                      () => listPerTripController.list.isEmpty
                          ? const EmptyWidget()
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: listPerTripController.list.length,
                              itemBuilder: (context, index) => ToDoCard(
                                index: index,
                                cityName: nameTrip,
                                titleToDo:
                                    listPerTripController.list[index].title!,
                                list: listPerTripController.list,
                              ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 80,
                        bottom: 20,
                      ),
                      child: CustomButton(
                        onTap: () {
                          listPerTripController.redirectAddToDoScreen(nameTrip);
                        },
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
