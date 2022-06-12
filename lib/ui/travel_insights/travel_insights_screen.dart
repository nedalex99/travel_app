import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/ui/travel_insights/components/travel_insight_card.dart';
import 'package:travel_app/ui/travel_insights/travel_insights_controller.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/images.dart';

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
            Obx(
              () => SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4.0,
                        vertical: 8.0,
                      ),
                      child: TravelInsightCard(
                        toursAndActivitiesModel:
                            _controller.toursAndActivitiesList[index],
                      ),
                    );
                  },
                  childCount: _controller.toursAndActivitiesList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
