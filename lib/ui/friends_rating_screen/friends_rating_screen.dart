import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/ui/friends_rating_screen/friends_rating_screen_controller.dart';
import 'package:travel_app/utils/constants/colors.dart';

class FriendsRatingScreen extends StatelessWidget {
  FriendsRatingScreen({
    Key? key,
    required this.flightTicket,
  }) : super(key: key) {
    controller = Get.put(
      FriendsRatingScreenController(
        flightTicket: flightTicket,
      ),
    );
  }

  final FlightTicket flightTicket;
  late final FriendsRatingScreenController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGeneralColor,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'People\'s rating',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            Obx(
              () => SliverPadding(
                padding: const EdgeInsets.all(
                  16.0,
                ),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return index == 0
                          ? Obx(
                              () => controller.userData.value.firstName != null
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 4.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            controller
                                                .userData.value.firstName!,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          getGeneralRating(),
                                        ],
                                      ),
                                    )
                                  : Container(),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.ratings[index - 1].ratingName,
                                ),
                                Row(
                                  children: createStars(
                                    controller.ratings[index - 1].ratingValue,
                                  ),
                                ),
                              ],
                            );
                    },
                    childCount: controller.ratings.length + 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getGeneralRating() {
    double generalRating = 0;
    controller.ratings.forEach((element) {
      generalRating += element.ratingValue;
    });
    return Text(
      'General rating ${(generalRating / controller.ratings.length).toStringAsFixed(2)}',
      style: TextStyle(
        color: Colors.black,
      ),
    );
  }

  List<Widget> createStars(double rating) {
    List<Widget> widgetList = [];
    for (int i = 0; i < rating; i++) {
      widgetList.add(
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
      );
    }
    return widgetList;
  }
}
