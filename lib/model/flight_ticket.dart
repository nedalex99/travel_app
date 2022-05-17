import 'dart:convert';

import 'package:travel_app/model/flight_card_details.dart';
import 'package:travel_app/model/passenger_model.dart';

class FlightTicket {
  FlightCardDetails flightCardDetails;
  List<Passenger> passengers;

  FlightTicket({
    required this.flightCardDetails,
    required this.passengers,
  });

  Map<String, dynamic> toJson() => {
        'flightCardDetails': flightCardDetails.toJson(),
        'passenger': passengers.map((e) => e.toJson()).toList(),
      };
}
