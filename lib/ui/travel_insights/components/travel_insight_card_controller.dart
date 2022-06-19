import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/model/tours_and_activities_model.dart';
import 'package:travel_app/utils/session_temp.dart';

class TravelInsightCardController extends GetxController {
  RxBool textShowMoreFlag = false.obs;
  RxBool isChecked = false.obs;

  final FlightTicket? flightTicket;
  final ToursAndActivitiesModel toursAndActivitiesModel;

  TravelInsightCardController({
    required this.flightTicket,
    required this.toursAndActivitiesModel,
  });

  Future<void> openLocation({
    required double latitude,
    required double longitude,
  }) async {
    MapsLauncher.launchCoordinates(latitude, longitude);
  }

  Future<void> onToDoPress(bool? value) async {
    isChecked.toggle();
    if (value == true) {
      await FirebaseFirestore.instance
          .collection('to-do')
          .doc(userLoggedIn.uid)
          .collection(flightTicket!.flightCardDetails.arrivalCity!)
          .add(
        {
          'title': toursAndActivitiesModel.name,
        },
      );
    } else {
      await FirebaseFirestore.instance
          .collection('to-do')
          .doc(userLoggedIn.uid)
          .collection(flightTicket!.flightCardDetails.arrivalCity!)
          .where('title', isEqualTo: toursAndActivitiesModel.name!)
          .get()
          .then((value) async {
        value.docs.forEach(
          (element) async {
            FirebaseFirestore.instance
                .collection('to-do')
                .doc(userLoggedIn.uid)
                .collection(flightTicket!.flightCardDetails.arrivalCity!)
                .doc(
                  element.id,
                );
          },
        );
      });
    }
  }
}
