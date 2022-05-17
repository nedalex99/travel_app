class FlightCardDetails {
  List<String> departureCode;
  List<String> arrivalCode;
  List<String> departureTime;
  List<String> arrivalTime;
  List<String> flightDuration;
  String price;

  FlightCardDetails({
    required this.departureCode,
    required this.arrivalCode,
    required this.departureTime,
    required this.arrivalTime,
    required this.flightDuration,
    required this.price,
  });

  Map<String, dynamic> toJson() => {
        'departureCode': departureCode.map((e) => e).toList(),
        'arrivalCode': arrivalCode.map((e) => e).toList(),
        'departureTime': departureTime.map((e) => e).toList(),
        'arrivalTime': arrivalTime.map((e) => e).toList(),
        'flightDuration': flightDuration.map((e) => e).toList(),
        'price': price,
      };
}
