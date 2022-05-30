import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/city_screen/components/city_widget.dart';
import 'package:travel_app/ui/city_screen/components/city_widget_controller.dart';
import 'package:travel_app/ui/dashboard/dashboard_screen.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';
import 'city_screen_controller.dart';

class ChooseCity extends StatelessWidget {
  ChooseCity({Key? key}) : super(key: key);
  final CityScreenController controller = Get.put(CityScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kGeneralColor,
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
          backgroundColor: kGeneralColor,
          actions: [
            TextButton(
              onPressed: () => {
                if (controller.cityList.length >= 3)
                  {
                    Get.off(
                      () => DashboardScreen(
                        cityOne: controller.cityList[0],
                        cityTwo: controller.cityList[1],
                        cityThree: controller.cityList[2],
                      ),
                    )
                  }
                else
                  {
                    print(controller.cityList.length),
                  },
              },
              child: const Text(
                "Next",
                style: kLittleTextStyle,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              const Text(
                "I'm interested in...",
                textAlign: TextAlign.start,
                style: kTitleScreenTextStyle,
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  CityWidget(
                    cityName: "Paris",
                    controller: Get.put(
                      CityWidgetController(),
                      tag: "paris_container",
                    ),
                    heightSizedbox: 196,
                    widthSizedbox: 160,
                    positionedLeft: 60,
                    positionedTop: 96,
                    heightContainer: 100,
                    widthContainer: 100,
                  ),
                  CityWidget(
                    cityName: "ggg",
                    controller: Get.put(
                      CityWidgetController(),
                      tag: "ggg_container",
                    ),
                    heightSizedbox: 170,
                    widthSizedbox: 190,
                    positionedLeft: 32,
                    positionedTop: 50,
                    heightContainer: 120,
                    widthContainer: 120,
                  ),
                ],
              ),
              Row(
                children: [
                  CityWidget(
                    cityName: "Rome",
                    controller: Get.put(
                      CityWidgetController(),
                      tag: "rome_container",
                    ),
                    heightSizedbox: 130,
                    widthSizedbox: 130,
                    positionedLeft: 0,
                    positionedTop: 20,
                    heightContainer: 99,
                    widthContainer: 120,
                  ),
                  CityWidget(
                    cityName: "Cvea",
                    controller: Get.put(
                      CityWidgetController(),
                      tag: "cvea_container",
                    ),
                    heightSizedbox: 140,
                    widthSizedbox: 100,
                    positionedLeft: 10,
                    positionedTop: 50,
                    heightContainer: 80,
                    widthContainer: 80,
                  ),
                  CityWidget(
                    cityName: "Berlin",
                    controller: Get.put(
                      CityWidgetController(),
                      tag: "ber_container",
                    ),
                    heightSizedbox: 130,
                    widthSizedbox: 140,
                    positionedLeft: 40,
                    positionedTop: 20,
                    heightContainer: 100,
                    widthContainer: 100,
                  ),
                ],
              ),
              Row(
                children: [
                  CityWidget(
                    cityName: "ede",
                    controller: Get.put(
                      CityWidgetController(),
                      tag: "ede_container",
                    ),
                    heightSizedbox: 110,
                    widthSizedbox: 90,
                    positionedLeft: 0,
                    positionedTop: 20,
                    heightContainer: 90,
                    widthContainer: 90,
                  ),
                  CityWidget(
                    cityName: "Bucharest",
                    controller: Get.put(
                      CityWidgetController(),
                      tag: "buc_container",
                    ),
                    heightSizedbox: 130,
                    widthSizedbox: 180,
                    positionedLeft: 30,
                    positionedTop: 0,
                    heightContainer: 130,
                    widthContainer: 130,
                  ),
                  CityWidget(
                    cityName: "Sofia",
                    controller: Get.put(
                      CityWidgetController(),
                      tag: "sofia_container",
                    ),
                    heightSizedbox: 100,
                    widthSizedbox: 90,
                    positionedLeft: 0,
                    positionedTop: 10,
                    heightContainer: 90,
                    widthContainer: 90,
                  ),
                ],
              ),
              Row(
                children: [
                  CityWidget(
                    cityName: "PS",
                    controller: Get.put(
                      CityWidgetController(),
                      tag: "ps_container",
                    ),
                    heightSizedbox: 100,
                    widthSizedbox: 100,
                    positionedLeft: 0,
                    positionedTop: 10,
                    heightContainer: 90,
                    widthContainer: 90,
                  ),
                  CityWidget(
                    cityName: "Porto",
                    controller: Get.put(
                      CityWidgetController(),
                      tag: "porto_container",
                    ),
                    heightSizedbox: 110,
                    widthSizedbox: 130,
                    positionedLeft: 30,
                    positionedTop: 0,
                    heightContainer: 90,
                    widthContainer: 90,
                  ),
                  CityWidget(
                    cityName: "Berlin",
                    controller: Get.put(
                      CityWidgetController(),
                      tag: "berlin_container",
                    ),
                    heightSizedbox: 135,
                    widthSizedbox: 140,
                    positionedLeft: 20,
                    positionedTop: 3,
                    heightContainer: 130,
                    widthContainer: 120,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
