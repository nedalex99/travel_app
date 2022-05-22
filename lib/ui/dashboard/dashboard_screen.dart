import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/recommendation_model.dart';
import 'package:travel_app/ui/base_scaffold.dart';
import 'package:travel_app/ui/dashboard/dashboard_controller.dart';
import 'package:travel_app/ui/to_do_list_screen/to_do_list_screen.dart';
import 'package:travel_app/ui/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';

import 'components/button_recommendation_controller.dart';
import 'components/recomandation_card.dart';

class DashboardScreen extends StatelessWidget {
  final String cityOne;
  final String cityTwo;
  final String cityThree;

  DashboardScreen({
    Key? key,
    required this.cityOne,
    required this.cityTwo,
    required this.cityThree,
  }) : super(key: key) {
    controller = Get.put(
      DashboardController(
        cityOne: cityOne,
        cityTwo: cityTwo,
        cityThree: cityThree,
      ),
    );
  }

  late final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
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
                    child: ClipRRect(
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
                              "https://${controller.img.value}",
                              width: 20,
                              height: 20,
                              fit: BoxFit.fill,
                            ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Hello  ${controller.userData.value.userName!}!",
                    style: kNormalTextStyle,
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
              height: 50.0,
            ),
            const Text(
              'Because you visit:',
              style: kDefaultHeaderTextStyle,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(cityOne),
            const SizedBox(
              height: 5.0,
            ),
            Obx(
              () => CarouselSlider.builder(
                itemCount: controller.recommendationList.value.length,
                itemBuilder: (context, index, realIndex) {
                  RecommendationModel recommendationModel = RecommendationModel(
                    name: controller.recommendationList[index].name,
                    relevance: controller.recommendationList[index].relevance,
                  );
                  return CardRecommendation(
                    recommendationModel: recommendationModel,
                  );
                },
                options: CarouselOptions(
                  height: 90,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.6,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(cityTwo),
            Obx(
              () => CarouselSlider.builder(
                itemCount: controller.recommendationList2.value.length,
                itemBuilder: (context, index, realIndex) {
                  RecommendationModel recommendationModel = RecommendationModel(
                    name: controller.recommendationList2[index].name,
                    relevance: controller.recommendationList2[index].relevance,
                  );
                  return CardRecommendation(
                    recommendationModel: recommendationModel,
                  );
                },
                options: CarouselOptions(
                  height: 90,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.6,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(cityThree),
            Obx(
              () => CarouselSlider.builder(
                itemCount: controller.recommendationList3.value.length,
                itemBuilder: (context, index, realIndex) {
                  RecommendationModel recommendationModel = RecommendationModel(
                    name: controller.recommendationList3[index].name,
                    relevance: controller.recommendationList3[index].relevance,
                  );
                  return CardRecommendation(
                    recommendationModel: recommendationModel,
                  );
                },
                options: CarouselOptions(
                  height: 90,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.6,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBarWidget(),
    );
  }
}
