import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/model/weather_model.dart';
import 'package:travel_app/ui/widgets/modal/trip_card_options_modal.dart';
import 'package:travel_app/utils/network/open_weather_api/get_weather_response.dart';
import 'package:travel_app/utils/network/open_weather_api/weather_search.dart';

class TripCardController extends GetxController {
  final String flightTicketId;
  final FlightTicket flightTicket;
  final Rx<Weather> weather = Weather().obs;
  RxBool isSaved;

  TripCardController({
    required this.flightTicketId,
    required this.flightTicket,
    required this.isSaved,
  });

  @override
  void onInit() {
    getWeather();
    super.onInit();
  }

  void showModal({
    required bool isInSavedScreen,
  }) {
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) {
        return TripCardOptionsModal(
          flightTicket: flightTicket,
          isSaved: isSaved.value,
          isInSavedScreen: isInSavedScreen,
        );
      },
    );
  }

  //Get Weather
  Future<void> getWeather() async {
    try {
      WeatherSearch()
          .getData(
            cityName: flightTicket.flightCardDetails.arrivalCity!,
          )
          .then(
            (value) => {
              if (value.statusCode == 200)
                {
                  Get.back(),
                  weather.value = (value as GetWeatherResponse).weather,
                }
              else
                {
                  print("eroare weather ${value.statusCode}"),
                }
            },
          );
    } catch (e) {
      print("Erroar +${e.toString()}");
    }
  }
}
