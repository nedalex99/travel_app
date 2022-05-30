import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/flight_card_details.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/model/tours_and_activities_model.dart';
import 'package:travel_app/ui/widgets/dialogs/loading_dialog.dart';
import 'package:travel_app/utils/network/amadeus_api/points_of_interest/points_of_interest.dart';
import 'package:travel_app/utils/network/amadeus_api/travel_insights/get_tours_activities_response.dart';
import 'package:travel_app/utils/network/amadeus_api/travel_insights/tours_and_activities_search.dart';

class TravelInsightsController extends GetxController {
  RxList<ToursAndActivitiesModel> toursAndActivitiesList =
      <ToursAndActivitiesModel>[].obs;

  final FlightTicket flightCardDetails;

  TravelInsightsController({
    required this.flightCardDetails,
  });

  @override
  void onInit() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      getLocationScore();
      getToursAndActivitiesByCity();
    });
    super.onInit();
  }

  Future<void> getToursAndActivitiesByCity() async {
    Get.dialog(
      LoadingDialog(),
      barrierDismissible: false,
    );
    ToursAndActivitiesSearch()
        .getToursAndActivitiesByLocation(
          latitude:
              double.tryParse(flightCardDetails.flightCardDetails.arrivalLat!)!,
          longitude: double.tryParse(
              flightCardDetails.flightCardDetails.arrivalLong!)!,
          radius: 1,
        )
        .then(
          (value) => {
            Get.back(),
            if (value.statusCode == 200)
              {
                toursAndActivitiesList.value =
                    (value as GetToursActivitiesResponse).toursAndActivities,
                print(toursAndActivitiesList.length),
              },
          },
        );
  }

  Future<void> getLocationScore() async {
    PointsOfInterest()
        .getPointsOfInterest(latitude: "48.8647", longitude: "2.349")
        .then(
          (value) => {
            if (value.statusCode == 200) {},
          },
        );
  }
}
