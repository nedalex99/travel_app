import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/airport_model.dart';
import 'package:travel_app/model/flights_model.dart';
import 'package:travel_app/ui/widgets/dialogs/loading_dialog.dart';
import 'package:travel_app/utils/network/amadeus_api/flight_offer_search/flight_offer_search.dart';
import 'package:travel_app/utils/network/amadeus_api/flight_offer_search/get_flight_offer_response.dart';

class CreateTripController extends GetxController {
  Rx<DateTime> selectedDate = DateTime(DateTime.now().year - 1).obs;
  RxString selectedDeparture = "".obs;
  late AirportModel selectedDepartureAirport;

  RxString selectedArrival = "".obs;
  late AirportModel selectedArrivalAirport;

  TextEditingController departureZoneController = TextEditingController();
  TextEditingController arrivalZoneController = TextEditingController();
  List<AirportModel> airportsList = [];
  RxBool didSearchFlights = false.obs;
  Rx<FlightsModel> flightList = FlightsModel().obs;

  @override
  void onInit() {
    readAirportsJson();
    super.onInit();
  }

  Future<void> getDate() async {
    DateTime? selectedDateFromPicker = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (selectedDateFromPicker != null) {
      selectedDate.value = selectedDateFromPicker;
    }
  }

  void getDepartureZone() {
    showMaterialScrollPicker<AirportModel>(
      context: Get.context!,
      items: airportsList,
      selectedItem: airportsList[0],
    );
  }

  List<AirportModel> getSuggestionsOfZoneByPattern({
    required String pattern,
  }) {
    return airportsList
        .where((element) => element.name!.isCaseInsensitiveContains(pattern))
        .toList();
  }

  Future<void> readAirportsJson() async {
    final String response = await rootBundle.loadString('assets/airports.json');
    final data = await json.decode(response);
    airportsList = (data as List).map((e) => AirportModel.fromJson(e)).toList();
  }

  Future<void> getFlights() async {
    didSearchFlights.value = true;
    Get.dialog(
      const LoadingDialog(),
      barrierDismissible: false,
    );
    await FlightOfferSearch()
        .getFlightOffer(
      departureCode: selectedDepartureAirport.code!,
      arrivalCode: selectedArrivalAirport.code!,
    )
        .then(
      (value) {
        Get.back();
        if (value.statusCode == 200) {
          flightList.value = (value as GetFlightOfferResponse).flightModel;
        }
      },
    );
  }
}
