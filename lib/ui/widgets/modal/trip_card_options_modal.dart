import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/ui/widgets/modal/trip_card_options_modal_controller.dart';

class TripCardOptionsModal extends StatelessWidget {
  TripCardOptionsModal({
    Key? key,
    required this.flightTicket,
    required this.isSaved,
    this.isInSavedScreen = false,
  }) : super(key: key) {
    print("Is saved $isSaved");
    controller = Get.put(
      TripCardOptionsModalController(
        isSaved: isSaved.obs,
        isInSavedScreen: isInSavedScreen,
      ),
      tag: flightTicket.id,
    );
  }

  final bool isSaved;
  final bool isInSavedScreen;
  final FlightTicket flightTicket;
  late TripCardOptionsModalController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(
              controller.isSaved.value ? Icons.bookmark : Icons.bookmark_border,
            ),
            title: Text(
              controller.isSaved.value ? 'Unsave this post' : 'Save this post',
            ),
            onTap: () => controller.saveThisTrip(
              flightTicket: flightTicket,
              flightTicketId: flightTicket.id,
            ),
          ),
        ],
      ),
    );
  }
}
