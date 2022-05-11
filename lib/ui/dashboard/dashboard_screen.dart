import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/base_scaffold.dart';
import 'package:travel_app/ui/dashboard/components/button_recomandation_widget.dart';
import 'package:travel_app/ui/dashboard/dashboard_controller.dart';
import 'package:travel_app/ui/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:travel_app/utils/constants/styles.dart';

import 'components/button_recommendation_controller.dart';
import 'components/recomandation_card.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  final controller = Get.put(DashboardController());
  final buttonCitiesController = Get.put(ButtonRecommendationController());

  final List<String> imageList = [
    'https://upload.wikimedia.org/wikipedia/commons/6/69/Paris_montage2.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/7/75/Collage_Rome.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/7/75/Collage_Rome.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/7/75/Collage_Rome.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/c/ca/Bucharest_collage_02.jpg',
  ];

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
                      child: controller.img.value != ''
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
                    controller.userData.value.userName!,
                    style: kNormalTextStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            const Text(
              'Recommendations depending on the city',
              style: kDefaultHeaderTextStyle,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonRecommendation(
                  controller: Get.put(
                    ButtonRecommendationController(),
                    tag: "button_1",
                  ),
                  text: 'PAR',
                ),
                ButtonRecommendation(
                  controller: Get.put(
                    ButtonRecommendationController(),
                    tag: "button_2",
                  ),
                  text: 'LIS',
                ),
                ButtonRecommendation(
                  controller: Get.put(
                    ButtonRecommendationController(),
                    tag: "button_3",
                  ),
                  text: 'OPO',
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            CarouselSlider.builder(
              itemCount: imageList.length,
              itemBuilder: (context, index, realIndex) {
                final urlImage = imageList[index];
                return CardRecommendation(
                  cityName: 'NUME ORAS',
                  relevance: ' NOTA',
                  //imageUrl: urlImage,
                );
              },
              options: CarouselOptions(
                height: 250,
                enableInfiniteScroll: false,
                viewportFraction: 0.6,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBarWidget(),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        child: Image.network(
          urlImage,
          fit: BoxFit.fill,
        ),
      );
}
