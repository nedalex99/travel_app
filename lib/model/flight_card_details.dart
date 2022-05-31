class FlightCardDetails {
  List<String>? departureCode;
  List<String>? arrivalCode;
  List<String>? departureTime;
  List<String>? arrivalTime;
  List<String>? flightDuration;
  String? arrivalLat;
  String? arrivalLong;
  String? price;

  FlightCardDetails({
    this.departureCode,
    this.arrivalCode,
    this.departureTime,
    this.arrivalTime,
    this.flightDuration,
    this.arrivalLat,
    this.arrivalLong,
    this.price,
  });

  Map<String, dynamic> toJson() => {
        'departureCode': departureCode!.map((e) => e).toList(),
        'arrivalCode': arrivalCode!.map((e) => e).toList(),
        'departureTime': departureTime!.map((e) => e).toList(),
        'arrivalTime': arrivalTime!.map((e) => e).toList(),
        'flightDuration': flightDuration!.map((e) => e).toList(),
        'arrivalLat': arrivalLat,
        'arrivalLong': arrivalLong,
        'price': price,
      };

  factory FlightCardDetails.fromJson(dynamic json) {
    return FlightCardDetails(
      departureCode:
          (json['departureCode'] as List).map((e) => e.toString()).toList(),
      arrivalCode:
          (json['arrivalCode'] as List).map((e) => e.toString()).toList(),
      departureTime:
          (json['departureTime'] as List).map((e) => e.toString()).toList(),
      arrivalTime:
          (json['arrivalTime'] as List).map((e) => e.toString()).toList(),
      flightDuration:
          (json['flightDuration'] as List).map((e) => e.toString()).toList(),
      arrivalLat: json['arrivalLat'],
      arrivalLong: json['arrivalLong'],
      price: json['price'],
    );
  }
}
