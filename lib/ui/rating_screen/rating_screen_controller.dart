import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/ui/friends_rating_screen/friends_rating_screen.dart';
import 'package:travel_app/ui/widgets/dialogs/loading_dialog.dart';
import 'package:travel_app/utils/session_temp.dart';

class RatingScreenController extends GetxController {
  RxDouble medicalRating = 0.0.obs;
  RxDouble safetyRating = 0.0.obs;
  RxDouble sightseeingRating = 0.0.obs;
  RxDouble shoppingRating = 0.0.obs;
  RxDouble nightLifeRating = 0.0.obs;
  RxDouble restaurantsRating = 0.0.obs;

  Future<void> addRating({
    required FlightTicket flightTicket,
  }) async {
    Map<String, dynamic> ratings = {
      'userId': userLoggedIn.uid,
      'MEDICAL': medicalRating.value,
      'SAFETY': safetyRating.value,
      'SIGHTSEEING': sightseeingRating.value,
      'SHOPPING': shoppingRating.value,
      'NIGHTLIFE': nightLifeRating.value,
      'RESTAURANTS': restaurantsRating.value,
    };
    Get.dialog(LoadingDialog());
    FirebaseFirestore.instance
        .collection('trips')
        .doc(flightTicket.id)
        .collection('ratings')
        .add(ratings)
        .then(
          (value) {
        Get.back();
      },
    );
  }

  void goToFriendsRating({
    required FlightTicket flightTicket,
  }) {
    Get.to(
          () =>
          FriendsRatingScreen(
            flightTicket: flightTicket,
          ),
    );
  }
}
