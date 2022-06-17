import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/ui/widgets/modal/trip_card_options_modal.dart';

class TripCardController extends GetxController {
  final String flightTicketId;
  final FlightTicket flightTicket;
  RxBool isSaved;

  TripCardController({
    required this.flightTicketId,
    required this.flightTicket,
    required this.isSaved,
  });

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
}
