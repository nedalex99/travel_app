import 'dart:convert';

import 'package:travel_app/model/flight_card_details.dart';
import 'package:travel_app/model/hotel_model.dart';
import 'package:travel_app/model/passenger_model.dart';

class FlightTicket {
  FlightCardDetails flightCardDetails;
  List<Passenger> passengers;
  HotelModel selectedHotel;
  List<String> usersUid;

  FlightTicket({
    required this.flightCardDetails,
    required this.passengers,
    required this.selectedHotel,
    required this.usersUid,
  });

  Map<String, dynamic> toJson() => {
        'flightCardDetails': flightCardDetails.toJson(),
        'passenger': passengers.map((e) => e.toJson()).toList(),
        'selectedHotel': selectedHotel.toJson(),
        'usersUid': usersUid,
      };

// factory FlightTicket.fromJson(dynamic json) {
//   return FlightTicket(
//     flightCardDetails: FlightCardDetails,
//     passengers: passengers,
//     selectedHotel: selectedHotel,
//   );
// }
}
