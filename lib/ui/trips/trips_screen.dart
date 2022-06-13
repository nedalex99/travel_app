import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/create_trip/create_trip_screen.dart';
import 'package:travel_app/ui/travel_insights/travel_insights_screen.dart';
import 'package:travel_app/ui/trips/trip_card.dart';
import 'package:travel_app/ui/trips/trips_screen_controller.dart';
import 'package:travel_app/ui/widgets/bottom_navigation_bar/bottom_nav_bar.dart';
import 'package:travel_app/utils/constants/colors.dart';

class TripsScreen extends StatelessWidget {
  TripsScreen({Key? key}) : super(key: key);

  final TripsScreenController tripsScreenController =
      Get.put(TripsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(
          () => CreateTripScreen(),
        ),
        tooltip: 'Add trip',
        child: const Icon(
          Icons.add,
        ),
        elevation: 2.0,
      ),
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
          Obx(
            () => SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return GestureDetector(
                    onTap: () => Get.to(
                      () => TravelInsightsScreen(
                        flightTicket: tripsScreenController.trips[index],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                        4.0,
                      ),
                      child: TripCard(
                        flightTicket: tripsScreenController.trips[index],
                      ),
                    ),
                  );
                },
                childCount: tripsScreenController.trips.length,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 1,
      ),
    );
  }
}
