import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/model/rating_model.dart';
import 'package:travel_app/model/user_data.dart';
import 'package:travel_app/utils/session_temp.dart';

class FriendsRatingScreenController extends GetxController {
  final FlightTicket flightTicket;
  RxList<RatingModel> ratings = <RatingModel>[].obs;
  final List<String> typeOfRatings = [
    'MEDICAL',
    'SAFETY',
    'SIGHTSEEING',
    'SHOPPING',
    'NIGHTLIFE',
    'RESTAURANTS',
  ];
  Rx<UserData> userData = UserData().obs;

  FriendsRatingScreenController({
    required this.flightTicket,
  });

  @override
  void onInit() {
    getRatings();
    super.onInit();
  }

  Future<void> getRatings() async {
    FirebaseFirestore.instance
        .collection('trips')
        .doc(flightTicket.id)
        .collection('ratings')
        // .where(
        //   'userId',
        //   isNotEqualTo: userLoggedIn.uid,
        // )
        .get()
        .then(
      (value) {
        for (var element in value.docs) {
          var json = element.data();
          getUserDataForRating(
            userUid: json['userId'],
          );
          for (var typeOfRating in typeOfRatings) {
            ratings.add(
              RatingModel(
                ratingName: typeOfRating,
                ratingValue: json[typeOfRating],
              ),
            );
          }
        }
      },
    );
  }

  Future<void> getUserDataForRating({
    required String userUid,
  }) async {
    await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: userUid)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        userData.value = UserData.fromJson(
          element,
        );
      });
    });
  }
}
