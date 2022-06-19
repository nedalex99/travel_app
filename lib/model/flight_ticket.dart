import 'dart:convert';

import 'package:travel_app/model/flight_card_details.dart';
import 'package:travel_app/model/hotel_model.dart';
import 'package:travel_app/model/passenger_model.dart';

class FlightTicket {
  late String id;
  FlightCardDetails flightCardDetails;
  List<Passenger> passengers;
  HotelModel selectedHotel;
  List<String> usersUid;
  List<String> savedBy;
  int budget;

  FlightTicket({
    required this.flightCardDetails,
    required this.passengers,
    required this.selectedHotel,
    required this.usersUid,
    required this.budget,
    this.savedBy = const [],
  });

  Map<String, dynamic> toJson() => {
        'flightCardDetails': flightCardDetails.toJson(),
        'passenger': passengers.map((e) => e.toJson()).toList(),
        'selectedHotel': selectedHotel.toJson(),
        'usersUid': usersUid,
        'savedBy': savedBy,
        'budget': budget,
      };

// factory FlightTicket.fromJson(dynamic json) {
//   return FlightTicket(
//     flightCardDetails: FlightCardDetails,
//     passengers: passengers,
//     selectedHotel: selectedHotel,
//   );
// }
}
