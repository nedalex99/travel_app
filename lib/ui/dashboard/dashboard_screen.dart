import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/recommendation_model.dart';
import 'package:travel_app/ui/base_scaffold.dart';
import 'package:travel_app/ui/dashboard/dashboard_controller.dart';
import 'package:travel_app/ui/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
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
  }) : super(key: key);

  final controller = Get.put(DashboardController());
  final buttonCitiesController = Get.put(ButtonRecommendationController());
  RxList<RecommendationModel> recommendationList = <RecommendationModel>[].obs;
  RxList<RecommendationModel> recommendationList2 = <RecommendationModel>[].obs;
  RxList<RecommendationModel> recommendationList3 = <RecommendationModel>[].obs;

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
            TextButton(
              onPressed: () => {
                controller.cityRecommendation = 'PAR'.obs,
                controller.getRecommendation(recommendationList),
              },
              child: Text(cityOne),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Obx(
              () => CarouselSlider.builder(
                itemCount: recommendationList.length,
                itemBuilder: (context, index, realIndex) {
                  RecommendationModel recommendationModel = RecommendationModel(
                    name: recommendationList[index].name,
                    relevance: recommendationList[index].relevance,
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
            TextButton(
              onPressed: () => {
                controller.cityRecommendation = 'OPO'.obs,
                controller.getRecommendation(recommendationList2),
              },
              child: Text(cityTwo),
            ),
            Obx(
              () => CarouselSlider.builder(
                itemCount: recommendationList2.length,
                itemBuilder: (context, index, realIndex) {
                  RecommendationModel recommendationModel = RecommendationModel(
                    name: recommendationList2[index].name,
                    relevance: recommendationList2[index].relevance,
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
            TextButton(
              onPressed: () => {
                controller.cityRecommendation = 'NCE'.obs,
                controller.getRecommendation(recommendationList3),
              },
              child: Text(cityThree),
            ),
            Obx(
              () => CarouselSlider.builder(
                itemCount: recommendationList3.length,
                itemBuilder: (context, index, realIndex) {
                  RecommendationModel recommendationModel = RecommendationModel(
                    name: recommendationList3[index].name,
                    relevance: recommendationList3[index].relevance,
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
