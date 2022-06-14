import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/recommendation_model.dart';
import 'package:travel_app/ui/city_details/city_details_controller.dart';
import 'package:travel_app/ui/travel_insights/components/travel_insight_card.dart';
import 'package:travel_app/ui/weather/weather_widget.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';
import 'package:travel_app/utils/constants/values.dart';

class CityDetails extends StatelessWidget {
  final RecommendationModel recommendationModel;

  CityDetails({
    Key? key,
    required this.recommendationModel,
  }) : super(key: key) {
    controller = Get.put(
      CityDetailsController(
        recommendationModel: recommendationModel,
      ),
    );
  }

  late final CityDetailsController controller;

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
            recommendationModel.name!,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image.network(
                  'https://romaniansmartcity.ro/wp-content/uploads/2018/03/verticale-smart-city_arscm.jpg',
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Divider(
                    color: kDark2Color,
                    height: 10.0,
                    thickness: 2,
                    indent: 90,
                    endIndent: 90,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      controller.openLocation(
                          latitude: recommendationModel.geoCode!.latitude!,
                          longitude: recommendationModel.geoCode!.longitude!);
                    },
                    child: const Text(
                      "See location",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: SizedBox(
                    height: 100,
                    child: Obx(
                      () => controller.weather.value.condition != null
                          ? WeatherWidget(
                              iconUrl: getWeatherImage(
                                controller.weather.value.condition,
                              ),
                              description:
                                  controller.weather.value.description!,
                              temp: controller.weather.value.temperature!,
                            )
                          : Container(
                              height: 90,
                              color: kGeneralColor,
                            ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Location Score:",
                    style: kLittleTextStyle,
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: Obx(
                    () => ListView.builder(
                        itemCount: controller.locationScoreList.isEmpty
                            ? 3
                            : controller.locationScoreList.length,
                        itemBuilder: (context, index) {
                          double notaShopping =
                              controller.locationScoreList.isEmpty
                                  ? 9.5
                                  : controller.locationScoreList[index]
                                          .categoryScores!.shopping!.overall! /
                                      10;
                          double notaNightLife =
                              controller.locationScoreList.isEmpty
                                  ? 8.6
                                  : controller.locationScoreList[index]
                                          .categoryScores!.nightLife!.overall! /
                                      10;
                          double notaRestaurant =
                              controller.locationScoreList.isEmpty
                                  ? 9.7
                                  : controller
                                          .locationScoreList[index]
                                          .categoryScores!
                                          .restaurant!
                                          .overall! /
                                      10;
                          return DataTable(
                            dataRowHeight: 40,
                            headingRowHeight: 45,
                            columns: const [
                              DataColumn(
                                label: Text('Category'),
                              ),
                              DataColumn(
                                label: Text('Note'),
                              ),
                            ],
                            rows: [
                              DataRow(
                                cells: [
                                  const DataCell(
                                    Text('Shopping'),
                                  ),
                                  DataCell(
                                    Text(
                                      notaShopping.toString(),
                                    ),
                                  )
                                ],
                              ),
                              DataRow(
                                cells: [
                                  const DataCell(
                                    Text('Night Life'),
                                  ),
                                  DataCell(
                                    Text(
                                      notaNightLife.toString(),
                                    ),
                                  )
                                ],
                              ),
                              DataRow(
                                cells: [
                                  const DataCell(
                                    Text('Restaurant'),
                                  ),
                                  DataCell(
                                    Text(
                                      notaRestaurant.toString(),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          );
                        }),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Divider(
                    color: kDark2Color,
                    height: 10.0,
                    thickness: 2,
                    indent: 90,
                    endIndent: 90,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "What you can do here?",
                      style: kLittleTextColoredStyle,
                    ),
                  ),
                ),
                Obx(
                  () => controller.toursAndActivitiesList.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.toursAndActivitiesList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4.0,
                                vertical: 8.0,
                              ),
                              child: TravelInsightCard(
                                toursAndActivitiesModel:
                                    controller.toursAndActivitiesList[index],
                              ),
                            );
                          })
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
