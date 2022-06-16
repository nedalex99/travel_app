import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/create_trip/create_trip_screen.dart';
import 'package:travel_app/ui/dashboard/components/recomandation_card.dart';
import 'package:travel_app/ui/dashboard/dashboard_controller.dart';
import 'package:travel_app/ui/to_do_list_screen/to_do_list_screen.dart';
import 'package:travel_app/ui/widgets/bottom_navigation_bar/bottom_nav_bar.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';

class DashboardScreen extends StatelessWidget {
  final String? cityOne;
  final String? cityTwo;
  final String? cityThree;

  DashboardScreen({
    Key? key,
    this.cityOne,
    this.cityTwo,
    this.cityThree,
  }) : super(key: key) {
    controller = Get.put(
      DashboardController(
        cityOne: cityOne!,
        cityTwo: cityTwo!,
        cityThree: cityThree!,
      ),
    );
  }

  late final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(
          () => CreateTripScreen(),
        ),
        tooltip: 'Add trip',
        child: const Icon(
          Icons.add,
        ),
        elevation: 2.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 18.0,
          top: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 60.0,
                left: 10.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue,
                    child: Obx(
                      () => ClipRRect(
                        borderRadius: BorderRadius.circular(
                          50.0,
                        ),
                        child: controller.img.value == ''
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    50.0,
                                  ),
                                ),
                                width: 25,
                                height: 25,
                              )
                            : Image.network(
                                controller.img.value,
                                width: 50,
                                height: 50,
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Obx(
                      () => Text(
                        "Hello ${controller.userData.value.userName!}!",
                        style: kNormalTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => ToDoListScreen());
                },
                child: Container(
                  height: 45,
                  width: 140,
                  decoration: const BoxDecoration(
                    color: kGeneralColor,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 2,
                        color: kDark2Color,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      bottomLeft: Radius.circular(40.0),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "To Do List",
                      style: kLittleTextStyle,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              'Suggestions based on your wishlist:',
              style: kDefaultHeaderTextStyle,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => {controller.getRecommendation()},
                  child: Text(controller.cityOne),
                ),
                TextButton(
                  onPressed: () => {
                    controller.getRecommendationButton2(),
                  },
                  child: Text(controller.cityTwo),
                ),
                TextButton(
                  onPressed: () => {
                    controller.getRecommendationButton3(),
                  },
                  child: Text(controller.cityThree),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Obx(
              () => CarouselSlider.builder(
                  itemCount: controller.recommendationList.value.length,
                  itemBuilder: (context, index, realIndex) {
                    return CardRecommendation(
                      recommendationModel: controller.recommendationList[index],
                    );
                  },
                  options: CarouselOptions(
                    height: 130,
                    enableInfiniteScroll: false,
                    viewportFraction: 0.7,
                  )),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                'Because you visit:',
                style: kDefaultHeaderTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(
                    () => controller.trips.isNotEmpty
                        ? SizedBox(
                            height: 100,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.trips.length,
                                itemBuilder: (context, index) {
                                  return TextButton(
                                      onPressed: () => {
                                            controller.getRecommendation(),
                                          },
                                      child: Text(controller.trips[index]
                                          .flightCardDetails.arrivalCity!));
                                }),
                          )
                        : Container(
                            height: 90,
                            width: 370,
                            decoration: BoxDecoration(
                              color: kContainerRecommendation,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Center(
                                child: Text(
                                  'No data yet...',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0,
      ),
    );
  }
}
