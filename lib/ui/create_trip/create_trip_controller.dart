import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/airport_model.dart';
import 'package:travel_app/utils/network/amadeus_api/flight_offer_search/flight_offer_search.dart';

class CreateTripController extends GetxController {
  Rx<DateTime> selectedDate = DateTime(DateTime.now().year - 1).obs;
  RxString selectedDeparture = "".obs;
  AirportModel selectedDepartureAirport = AirportModel();

  RxString selectedArrival = "".obs;
  AirportModel selectedArrivalAirport = AirportModel();

  TextEditingController departureZoneController = TextEditingController();
  TextEditingController arrivalZoneController = TextEditingController();
  List<AirportModel> airportsList = [];

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
    FlightOfferSearch()
        .getFlightOffer(
            departureCode: selectedDepartureAirport.code!,
            arrivalCode: selectedArrivalAirport.code!)
        .then((value) => print(value.statusCode));
  }
}
