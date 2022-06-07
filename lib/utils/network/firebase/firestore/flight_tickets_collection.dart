import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/flight_ticket.dart';
import 'package:travel_app/utils/session_temp.dart';

class FlightTicketsCollection extends GetConnect {
  Future<DocumentReference> addFlightTicket({
    required FlightTicket flightTicket,
  }) async {
    return FirebaseFirestore.instance.collection("trips").add(
          flightTicket.toJson(),
        );
  }
}
