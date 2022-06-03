import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/city_screen/components/city_widget.dart';
import 'package:travel_app/ui/city_screen/components/city_widget_controller.dart';
import 'package:travel_app/ui/dashboard/dashboard_screen.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/images.dart';
import 'package:travel_app/utils/constants/styles.dart';
import 'city_screen_controller.dart';

class ChooseCity extends StatelessWidget {
  ChooseCity({Key? key}) : super(key: key);
  final CityScreenController controller = Get.put(CityScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: const BackButton(
              color: Colors.black,
            ),
            backgroundColor: kGeneralColor.withOpacity(0.5),
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
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          bottom: 10,
                          top: 10,
                        ),
                        child: Text(
                          "Choose a city you are interested in",
                          style: kTitleScreenTextStyle,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 60.0),
                        child: Text(
                          "Follow 3 cities to get started",
                          style: kNormalTextStyle,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CityWidget(
                            cityName: 'Paris',
                            cityImage: kParisImage,
                            controller: Get.put(
                              CityWidgetController(),
                              tag: "paris_container",
                            ),
                          ),
                          CityWidget(
                            cityName: 'Nice',
                            cityImage: kCityWidgetImage,
                            controller: Get.put(
                              CityWidgetController(),
                              tag: "nice_container",
                            ),
                          ),
                          CityWidget(
                            cityName: 'Rome',
                            cityImage: kRomeImage,
                            controller: Get.put(
                              CityWidgetController(),
                              tag: "rome_container",
                            ),
                          ),
                          CityWidget(
                            cityName: 'Tunis',
                            cityImage: kTunisImage,
                            controller: Get.put(
                              CityWidgetController(),
                              tag: "tunis_container",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CityWidget(
                            cityName: 'Berlin',
                            cityImage: kBerlinImage,
                            controller: Get.put(
                              CityWidgetController(),
                              tag: "berlin_container",
                            ),
                          ),
                          CityWidget(
                            cityName: 'Madrid',
                            cityImage: kMadridImage,
                            controller: Get.put(
                              CityWidgetController(),
                              tag: "madrid_container",
                            ),
                          ),
                          CityWidget(
                            cityName: 'Bucharest',
                            cityImage: kBucharestImage,
                            controller: Get.put(
                              CityWidgetController(),
                              tag: "bucharest_container",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CityWidget(
                            cityName: 'Barcelona',
                            cityImage: kBarcelonaImage,
                            controller: Get.put(
                              CityWidgetController(),
                              tag: "barcelona_container",
                            ),
                          ),
                          CityWidget(
                            cityName: 'Athens',
                            cityImage: kAthensImage,
                            controller: Get.put(
                              CityWidgetController(),
                              tag: "athens_container",
                            ),
                          ),
                          CityWidget(
                            cityName: 'Porto',
                            cityImage: kPortoImage,
                            controller: Get.put(
                              CityWidgetController(),
                              tag: "porto_container",
                            ),
                          ),
                          CityWidget(
                            cityName: 'Amsterdam',
                            cityImage: kAmsterdamImage,
                            controller: Get.put(
                              CityWidgetController(),
                              tag: "amsterdam_container",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CityWidget(
                            cityName: 'Naples',
                            cityImage: kCityWidgetImage,
                            controller: Get.put(
                              CityWidgetController(),
                              tag: "naples_container",
                            ),
                          ),
                          CityWidget(
                            cityName: 'Milan',
                            cityImage: kMilanImage,
                            controller: Get.put(
                              CityWidgetController(),
                              tag: "milan_container",
                            ),
                          ),
                          CityWidget(
                            cityName: 'Venice',
                            cityImage: kVeniceImage,
                            controller: Get.put(
                              CityWidgetController(),
                              tag: "venice_container",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CityWidget(
                            cityName: 'Prague',
                            cityImage: kPragueImage,
                            controller: Get.put(
                              CityWidgetController(),
                              tag: "prague_container",
                            ),
                          ),
                          CityWidget(
                            cityName: 'Budapest',
                            cityImage: kCityWidgetImage,
                            controller: Get.put(
                              CityWidgetController(),
                              tag: "budapest_container",
                            ),
                          ),
                          CityWidget(
                            cityName: 'Sofia',
                            cityImage: kSofiaImage,
                            controller: Get.put(
                              CityWidgetController(),
                              tag: "sofia_container",
                            ),
                          ),
                          CityWidget(
                            cityName: 'Istanbul',
                            cityImage: kIstanbulImage,
                            controller: Get.put(
                              CityWidgetController(),
                              tag: "istanbul_container",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CityWidget(
                            cityName: 'Dubai',
                            cityImage: kDubaiImage,
                            controller: Get.put(
                              CityWidgetController(),
                              tag: "dubai_container",
                            ),
                          ),
                          CityWidget(
                            cityName: 'Ankara',
                            cityImage: kCityWidgetImage,
                            controller: Get.put(
                              CityWidgetController(),
                              tag: "ankara_container",
                            ),
                          ),
                          CityWidget(
                            cityName: 'Konya',
                            cityImage: kCityWidgetImage,
                            controller: Get.put(
                              CityWidgetController(),
                              tag: "konya_container",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
