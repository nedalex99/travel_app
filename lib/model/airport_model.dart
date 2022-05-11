class AirportModel {
  AirportModel({
    required this.code,
    required this.lat,
    required this.lon,
    required this.name,
    required this.city,
    required this.state,
    required this.country,
    required this.woeid,
    required this.tz,
    required this.phone,
    required this.type,
    required this.email,
    required this.url,
    required this.runwayLength,
    required this.elev,
    required this.icao,
    required this.directFlights,
    required this.carriers,
  });

  factory AirportModel.fromJson(dynamic json) {
    return AirportModel(
      code: json['code'],
      lat: json['lat'],
      lon: json['lon'],
      name: json['name'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      woeid: json['woeid'],
      tz: json['tz'],
      phone: json['phone'],
      type: json['type'],
      email: json['email'],
      url: json['url'],
      runwayLength: json['runway_length'],
      elev: json['elev'],
      icao: json['icao'],
      directFlights: json['direct_flights'],
      carriers: json['carriers'],
    );
  }

  final String? code;
  final String? lat;
  final String? lon;
  final String? name;
  final String? city;
  final String? state;
  final String? country;
  final String? woeid;
  final String? tz;
  final String? phone;
  final String? type;
  final String? email;
  final String? url;
  final String? runwayLength;
  final String? elev;
  final String? icao;
  final String? directFlights;
  final String? carriers;

  AirportModel copyWith({
    required String code,
    required String lat,
    required String lon,
    required String name,
    required String city,
    required String state,
    required String country,
    required String woeid,
    required String tz,
    required String phone,
    required String type,
    required String email,
    required String url,
    required String runwayLength,
    required String elev,
    required String icao,
    required String directFlights,
    required String carriers,
  }) =>
      AirportModel(
        code: code,
        lat: lat,
        lon: lon,
        name: name,
        city: city,
        state: state,
        country: country,
        woeid: woeid,
        tz: tz,
        phone: phone,
        type: type,
        email: email,
        url: url,
        runwayLength: runwayLength,
        elev: elev,
        icao: icao,
        directFlights: directFlights,
        carriers: carriers,
      );
}
