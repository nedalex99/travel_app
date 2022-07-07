import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/model/tours_and_activities_model.dart';
import 'package:travel_app/ui/expenses_screen/expenses_screen.dart';
import 'package:travel_app/ui/photo_album/photo_album_screen.dart';
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

  void redirectAddPhoto() {
    Get.to(
      () => PhotoAlbumScreen(
        tripName: flightCardDetails.flightCardDetails.arrivalCity!,
      ),
    );
  }

  void redirectExpenses() {
    Get.to(
      () => TransactionsScreen(
        flightTicket: flightCardDetails,
      ),
    );
  }

  Future<void> getToursAndActivitiesByCity() async {
    Get.dialog(
      const LoadingDialog(),
      barrierDismissible: false,
    );
    await ToursAndActivitiesSearch()
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
                    (value as GetToursActivitiesResponse)
                        .toursAndActivities
                        .take(15)
                        .toList(),
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

  Future<void> addToDo({
    required ToursAndActivitiesModel toursAndActivitiesModel,
  }) async {
    await FirebaseFirestore.instance
        .collection('trips')
        .doc(flightCardDetails.id)
        .collection('to-do')
        .add(
      {
        'name': toursAndActivitiesModel.name!,
      },
    );
  }
}
