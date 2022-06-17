import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/create_trip/create_trip_screen.dart';
import 'package:travel_app/ui/saved_screen/saved_screen_controller.dart';
import 'package:travel_app/ui/travel_insights/travel_insights_screen.dart';
import 'package:travel_app/ui/trips/trip_card.dart';
import 'package:travel_app/ui/widgets/bottom_navigation_bar/bottom_nav_bar.dart';
import 'package:travel_app/utils/constants/colors.dart';

class SavedScreen extends StatelessWidget {
  SavedScreen({Key? key}) : super(key: key);

  final SavedScreenController controller = Get.put(SavedScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGeneralColor,
        title: const Text(
          'Saved trips',
          style: TextStyle(
            color: kDark2Color,
          ),
        ),
      ),
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
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            Obx(
              () => SliverPadding(
                padding: const EdgeInsets.all(
                  8.0,
                ),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4.0,
                      ),
                      child: GestureDetector(
                        onTap: () => Get.to(
                          () => TravelInsightsScreen(
                            flightTicket: controller.trips[index],
                          ),
                        ),
                        child: TripCard(
                          flightTicket: controller.trips[index],
                          weather: controller.weather.value,
                          isInSavedScreen: true,
                        ),
                      ),
                    ),
                    childCount: controller.trips.length,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 3,
      ),
    );
  }
}
