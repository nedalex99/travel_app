import 'package:get/get.dart';
import 'package:travel_app/model/flight_card_details.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/model/hotel_model.dart';
import 'package:travel_app/model/passenger_model.dart';
import 'package:travel_app/model/weather_model.dart';
import 'package:travel_app/utils/network/firebase/firestore/trips_collection.dart';
import 'package:travel_app/utils/network/open_weather_api/get_weather_response.dart';
import 'package:travel_app/utils/network/open_weather_api/weather_search.dart';
import 'package:travel_app/utils/session_temp.dart';

class TripsScreenController extends GetxController {
  RxList<FlightTicket> trips = <FlightTicket>[].obs;
  Rx<Weather> weather = Weather().obs;

  @override
  void onInit() {
    getTrips();
   // getWeather();
    super.onInit();
  }

  Future<void> getTrips() async {
    await TripsCollection().getTrips().then((value) {
      value.docs.forEach((element) {
        var json = element.data() as Map;
        print(json);
        final FlightCardDetails flightCardDetails =
            FlightCardDetails.fromJson(json['flightCardDetails']);
        final List<Passenger> passengersList = (json['passenger'] as List)
            .map((e) => Passenger.fromJson(e))
            .toList();
        final HotelModel hotelModel =
            HotelModel.fromJson(json['selectedHotel']);
        final List<String> usersUid = (json['usersUid'] as List)
            .map(
              (e) => e.toString(),
            )
            .toList();
        List<String> savedBy =
            (json['savedBy'] as List).map((e) => e.toString()).toList();
        final FlightTicket flightTicket = FlightTicket(
          flightCardDetails: flightCardDetails,
          passengers: passengersList,
          selectedHotel: hotelModel,
          usersUid: usersUid,
          savedBy: savedBy,
        );
        flightTicket.id = element.id;
        if (flightTicket.usersUid.contains(userLoggedIn.uid)) {
          trips.add(flightTicket);
        }
      });
    });
  }
  //
  // Future<void> getWeather() async {
  //   try {
  //     WeatherSearch()
  //         .getData(
  //           cityName: "Paris",
  //         )
  //         .then(
  //           (value) => {
  //             if (value.statusCode == 200)
  //               {
  //                 Get.back(),
  //                 weather.value = (value as GetWeatherResponse).weather,
  //               }
  //             else
  //               {
  //                 print("eroare weather ${value.statusCode}"),
  //               }
  //           },
  //         );
  //   } catch (e) {
  //     print("Erroar +${e.toString()}");
  //   }
  // }
}
