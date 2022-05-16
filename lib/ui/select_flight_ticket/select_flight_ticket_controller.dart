import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/flight_card_details.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/model/passenger_model.dart';
import 'package:travel_app/ui/widgets/dialogs/loading_dialog.dart';
import 'package:travel_app/utils/network/firebase/firestore/flight_tickets_collection.dart';

class SelectFlightTicketController extends GetxController {
  TextEditingController firstNameTextController = TextEditingController();
  TextEditingController lastNameTextController = TextEditingController();
  TextEditingController genderTextController = TextEditingController();
  TextEditingController dateBirthTextController = TextEditingController();

  RxList<Passenger> passengers = <Passenger>[].obs;

  void firstNameChanged(String value) {}

  void lastNameChanged(String value) {}

  void genderNameChanged(String value) {}

  void dateBirthNameChanged(String value) {}

  void addPassenger() {
    passengers.add(
      Passenger(
        firstName: firstNameTextController.text,
        lastName: lastNameTextController.text,
        gender: genderTextController.text,
        dateBirth: dateBirthTextController.text,
      ),
    );
    firstNameTextController.clear();
    lastNameTextController.clear();
    genderTextController.clear();
    dateBirthTextController.clear();
  }

  Future<void> addFlightTicket({
    required FlightCardDetails flightCardDetails,
  }) async {
    Get.dialog(const LoadingDialog());
    await FlightTicketsCollection()
        .addFlightTicket(
          flightTicket: FlightTicket(
            flightCardDetails: flightCardDetails,
            passengers: passengers,
          ),
        )
        .then(
          (value) => {
            Get.back(),
          },
        );
  }
}
