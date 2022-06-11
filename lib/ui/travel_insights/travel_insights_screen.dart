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
        // AppBar(
        //   backgroundColor: kGeneralColor,
        //   title: Text(
        //     'Travel insights for ${flightTicket.flightCardDetails.arrivalCode![0]}',
        //     style: const TextStyle(
        //       color: Colors.black,
        //     ),
        //   ),
        // ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {},
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 4.0,
                  right: 4.0,
                  top: 8.0,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Tours & Activities',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
            ),
            // Obx(
            //   () => SliverList(
            //     delegate: SliverChildBuilderDelegate(
            //       (context, index) {
            //         return Padding(
            //           padding: const EdgeInsets.symmetric(
            //             horizontal: 4.0,
            //             vertical: 8.0,
            //           ),
            //           child: TravelInsightCard(
            //             toursAndActivitiesModel:
            //                 _controller.toursAndActivitiesList[index],
            //           ),
            //         );
            //       },
            //       childCount: _controller.toursAndActivitiesList.length,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
