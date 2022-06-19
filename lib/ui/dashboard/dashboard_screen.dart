import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/create_trip/create_trip_screen.dart';
import 'package:travel_app/ui/dashboard/components/city_buttons_controller.dart';
import 'package:travel_app/ui/dashboard/components/city_buttons_widget.dart';
import 'package:travel_app/ui/dashboard/components/recomandation_card.dart';
import 'package:travel_app/ui/dashboard/dashboard_controller.dart';
import 'package:travel_app/ui/to_do_list_screen/to_do_list_screen.dart';
import 'package:travel_app/ui/widgets/bottom_navigation_bar/bottom_nav_bar.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/images.dart';
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
          left: 10.0,
          top: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 50.0,
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
                // CityButtonsWidget(
                //   text: controller.cityOne,
                //   controller: Get.put(
                //     CityButtonsController(),
                //     tag: "button_controller_1",
                //   ),
                // ),
                // CityButtonsWidget(
                //   text: controller.cityTwo,
                //   controller: Get.put(
                //     CityButtonsController(),
                //     tag: "button_controller_2",
                //   ),
                // ),
                // CityButtonsWidget(
                //   text: controller.cityThree,
                //   controller: Get.put(
                //     CityButtonsController(),
                //     tag: "button_controller_3",
                //   ),
                // ),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                    () => controller.trips.isNotEmpty
                        ? SizedBox(
                            height: 30,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.trips.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: TextButton(
                                        onPressed: () => {
                                              controller
                                                  .getRecommendationForMyTrips(
                                                controller
                                                    .trips[index]
                                                    .flightCardDetails
                                                    .arrivalCode![0],
                                              ),
                                            },
                                        child: Text(
                                          controller.trips[index]
                                              .flightCardDetails.arrivalCity!,
                                        )),
                                  );
                                }),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
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
                                      'You have no saved trips...',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 5,
                                ),
                                child: Image.asset(
                                  kArrow,
                                  height: 50,
                                ),
                              ),
                            ],
                          ),
                  )
                ],
              ),
            ),
            Obx(
              () => CarouselSlider.builder(
                itemCount: controller.recommendationListForTrip.value.length,
                itemBuilder: (context, index, realIndex) {
                  return CardRecommendation(
                    recommendationModel:
                        controller.recommendationListForTrip[index],
                  );
                },
                options: CarouselOptions(
                  height: 130,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.7,
                ),
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
