import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/recommendation_model.dart';
import 'package:travel_app/ui/city_details/city_details_controller.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';

class CityDetails extends StatelessWidget {
  RecommendationModel recommendationModel;

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
          body: Padding(
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
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Location Score",
                    style: kLittleTextStyle,
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                        itemCount: controller.locationScoreList.length,
                        itemBuilder: (context, index) {
                          int? notaShopping = controller
                              .locationScoreList[index]
                              .categoryScores!
                              .shopping!
                              .overall;
                          int? notaNightLife = controller
                              .locationScoreList[index]
                              .categoryScores!
                              .nightLife!
                              .overall;
                          int? notaRestaurant = controller
                              .locationScoreList[index]
                              .categoryScores!
                              .restaurant!
                              .overall;
                          return DataTable(
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
              ],
            ),
          )),
    );
  }
}
