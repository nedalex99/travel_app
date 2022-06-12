import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/ui/travel_insights/components/travel_insight_card.dart';
import 'package:travel_app/ui/travel_insights/travel_insights_controller.dart';
import 'package:travel_app/utils/constants/colors.dart';

class TravelInsightsScreen extends StatelessWidget {
  final FlightTicket flightTicket;
  late final TravelInsightsController _controller;

  TravelInsightsScreen({
    Key? key,
    required this.flightTicket,
  }) : super(key: key) {
    _controller = Get.put(
      TravelInsightsController(
        flightCardDetails: flightTicket,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kContainerRecommendation,
          leading: const BackButton(
            color: Colors.black,
          ),
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: kWithe,
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      left: 10.0,
                      right: 180.0,
                      bottom: 10.0,
                    ),
                    child: Text(
                      flightTicket.flightCardDetails.arrivalCity!,
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _controller.redirectAddPhoto();
                    },
                    icon: Image.asset(
                      kPhotoAlbum,
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Flight',
              ),
              Tab(
                text: 'Hotels',
              ),
            ],
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.5,
              builder: (context, scrollController) {
                return Obx(
                  () => Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(
                          20.0,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Text(
                              'It\'s good to se you',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 8.0,
                            ),
                            child: Text(
                              'Explore Tips & Recommendations',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              // controller: scrollController,
                              itemCount:
                                  _controller.toursAndActivitiesList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4.0,
                                    vertical: 8.0,
                                  ),
                                  child: TravelInsightCard(
                                    toursAndActivitiesModel: _controller
                                        .toursAndActivitiesList[index],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
