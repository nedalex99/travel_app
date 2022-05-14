class FlightCardDetails {
  String departureCode;
  String arrivalCode;
  String departureTime;
  String arrivalTime;
  String flightDuration;
  String returnDepartureCode;
  String returnArrivalCode;
  String returnDepartureTime;
  String returnArrivalTime;
  String returnFlightDuration;
  String price;

  FlightCardDetails({
    required this.departureCode,
    required this.arrivalCode,
    required this.departureTime,
    required this.arrivalTime,
    required this.flightDuration,
    required this.returnDepartureCode,
    required this.returnArrivalCode,
    required this.returnDepartureTime,
    required this.returnArrivalTime,
    required this.returnFlightDuration,
    required this.price,
  });
}
