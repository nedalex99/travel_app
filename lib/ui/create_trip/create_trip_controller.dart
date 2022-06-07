import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/model/airport_model.dart';
import 'package:travel_app/model/flight_card_details.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/model/flights_model.dart';
import 'package:travel_app/model/hotel_model.dart';
import 'package:travel_app/model/passenger_model.dart';
import 'package:travel_app/ui/create_trip/components/hotel_card_controller.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/ui/widgets/dialogs/loading_dialog.dart';
import 'package:travel_app/utils/network/amadeus_api/flight_offer_search/flight_offer_search.dart';
import 'package:travel_app/utils/network/amadeus_api/flight_offer_search/get_flight_offer_response.dart';
import 'package:travel_app/utils/network/amadeus_api/hotel_search/get_hotels_response.dart';
import 'package:travel_app/utils/network/amadeus_api/hotel_search/hotel_search.dart';
import 'package:travel_app/utils/network/firebase/firestore/flight_tickets_collection.dart';
import 'package:travel_app/utils/session_temp.dart';

class CreateTripController extends GetxController {
  Rx<DateTime> selectedDepartureDate = DateTime(DateTime.now().year - 1).obs;
  Rx<DateTime> selectedArrivalDate = DateTime(DateTime.now().year - 1).obs;

  RxString selectedDeparture = "".obs;
  late AirportModel selectedDepartureAirport;

  RxString selectedArrival = "".obs;
  late AirportModel selectedArrivalAirport;

  TextEditingController departureZoneController = TextEditingController();
  TextEditingController arrivalZoneController = TextEditingController();
  TextEditingController dateOfDeparture = TextEditingController();
  TextEditingController dateOfArrival = TextEditingController();

  List<AirportModel> airportsList = [];
  RxBool didSearchFlights = false.obs;
  Rx<FlightsModel> flightList = FlightsModel().obs;
  RxList<Passenger> passengersList = <Passenger>[].obs;
  Rx<FlightCardDetails?> selectedFlight = FlightCardDetails().obs;
  List<String> usersUid = [];

  RxList<HotelModel> hotelsList = <HotelModel>[].obs;
  Rx<HotelModel> hotelSelected = HotelModel().obs;

  RxBool textShowMoreFlag = false.obs;

  @override
  void onInit() {
    readAirportsJson();
    super.onInit();
  }

  Future<void> getDate({
    bool isFromDeparture = false,
  }) async {
    DateTime? selectedDateFromPicker = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (selectedDateFromPicker != null) {
      if (isFromDeparture) {
        selectedDepartureDate.value = selectedDateFromPicker;
      } else {
        selectedArrivalDate.value = selectedDateFromPicker;
      }
    }
  }

  List<AirportModel> getSuggestionsOfZoneByPattern({
    required String pattern,
  }) {
    return airportsList
        .where((element) =>
            element.name!.isCaseInsensitiveContains(pattern) ||
            element.tz!.isCaseInsensitiveContains(pattern) ||
            element.country!.isCaseInsensitiveContains(pattern))
        .toList();
  }

  Future<void> readAirportsJson() async {
    final String response =
        await rootBundle.loadString('assets/europe_airports.json');
    final data = await json.decode(response);
    airportsList = (data as List).map((e) => AirportModel.fromJson(e)).toList();
  }

  Future<void> getFlights() async {
    didSearchFlights.value = true;
    print(
      DateFormat("yyyy-MM-dd").format(selectedDepartureDate.value).toString(),
    );
    Get.dialog(
      const LoadingDialog(),
      barrierDismissible: false,
    );
    await FlightOfferSearch()
        .getFlightOffer(
      departureCode: selectedDepartureAirport.code!,
      arrivalCode: selectedArrivalAirport.code!,
      departureDate: DateFormat("yyyy-MM-dd")
          .format(selectedDepartureDate.value)
          .toString(),
      arrivalDate:
          DateFormat("yyyy-MM-dd").format(selectedArrivalDate.value).toString(),
    )
        .then(
      (value) {
        Get.back();
        if (value.statusCode == 200) {
          flightList.value = (value as GetFlightOfferResponse).flightModel;
        } else {
          print(value.statusCode!);
        }
      },
    );
  }

  Future<void> getHotels() async {
    Get.dialog(const LoadingDialog());
    await HotelSearch()
        .getHotels(
          cityCode: selectedArrivalAirport.code!,
        )
        .then(
          (value) => {
            Get.back(),
            if (value.statusCode == 200)
              {
                hotelsList.value = (value as GetHotelsResponse).hotelsList,
              }
            else
              {
                print("error"),
              }
          },
        );
  }

  void onHotelSelected(int index) {
    if (hotelSelected.value.hotel != null) {
      var oldSelectedController = Get.find<HotelCardController>(
          tag: hotelSelected.value.hotel!.hotelId!);
      oldSelectedController.isSelected.value = false;

      var newSelectedController = Get.find<HotelCardController>(
        tag: hotelsList[index].hotel!.hotelId!,
      );

      if (hotelSelected.value.hotel!.hotelId! !=
          hotelsList[index].hotel!.hotelId!) {
        newSelectedController.isSelected.value = true;

        hotelSelected.value = hotelsList[index];
      }
    } else {
      var newSelectedController = Get.find<HotelCardController>(
        tag: hotelsList[index].hotel!.hotelId!,
      );
      newSelectedController.isSelected.value = true;
      hotelSelected.value = hotelsList[index];
    }
  }

  Future<void> onSaveTrip() async {
    usersUid.add(userLoggedIn.uid);
    Get.dialog(
      const LoadingDialog(),
      barrierDismissible: false,
    );
    await FlightTicketsCollection()
        .addFlightTicket(
          flightTicket: FlightTicket(
            passengers: passengersList,
            flightCardDetails: selectedFlight.value!,
            selectedHotel: hotelSelected.value,
            usersUid: usersUid,
          ),
        )
        .then(
          (value) => {
            Get.back(),
            Get.dialog(
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Wrap(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            6.0,
                          ),
                        ),
                        padding: const EdgeInsets.all(
                          16.0,
                        ),
                        child: Column(
                          children: [
                            const DefaultTextStyle(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                              child: Text(
                                'Great, find the best points of interest in the Trips screen. See you soon!',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            CustomButton(
                              onTap: () {
                                Get.back();
                                Get.back();
                              },
                              text: 'Finish',
                              backgroundColor: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          },
        );
  }
}
