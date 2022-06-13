import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/ui/create_trip/components/flights_list_card.dart';
import 'package:travel_app/ui/create_trip/components/long_hotel_card.dart';
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
          backgroundColor: kGeneralColor,
          title: Text(
            'Trip to ${flightTicket.flightCardDetails.arrivalCity!}',
            style: const TextStyle(
              fontSize: 24.0,
              color: Colors.black87,
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
            TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: FlightsListCard(
                    flightTicket: flightTicket,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: LongHotelCard(
                    hotelModel: flightTicket.selectedHotel,
                    checkIn: DateFormat("yyyy-MM-dd hh:mm")
                        .format(
                          DateTime.parse(
                            flightTicket.flightCardDetails.departureTime![0],
                          ),
                        )
                        .toString(),
                    checkOut: DateFormat("yyyy-MM-dd hh:mm")
                        .format(
                          DateTime.parse(
                            flightTicket.flightCardDetails.arrivalTime![0],
                          ),
                        )
                        .toString(),
                  ),
                ),
              ],
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.3,
              minChildSize: 0.3,
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
