import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/ui/base_scaffold.dart';
import 'package:travel_app/ui/travel_insights/travel_insights_screen.dart';
import 'package:travel_app/ui/trips/trips_screen_controller.dart';
import 'package:travel_app/ui/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:travel_app/utils/constants/colors.dart';

class TripsScreen extends StatelessWidget {
  TripsScreen({Key? key}) : super(key: key);

  TripsScreenController tripsScreenController =
      Get.put(TripsScreenController());

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text(
              'Your trips',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.black87,
              ),
            ),
            backgroundColor: kGeneralColor,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GestureDetector(
                  onTap: () => Get.to(
                    () => TravelInsightsScreen(
                      flightTicket: tripsScreenController.trips[index],
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        2.0,
                      ),
                    ),
                    padding: const EdgeInsets.all(
                      8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You will be leaving at ${DateFormat('E, d MMM yyyy HH:mm:ss').format(DateTime.parse(tripsScreenController.trips[index].flightCardDetails.departureTime![0]))}',
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Start: ${tripsScreenController.trips[index].flightCardDetails.departureCode![0]}',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'You will be staying at ${tripsScreenController.trips[index].selectedHotel.hotel!.name!}',
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'You will be travelling with ${tripsScreenController.trips[index].passengers.join(", ")}',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Tap to see more travel insights!',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: tripsScreenController.trips.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomAppBarWidget(),
    );
  }
}
