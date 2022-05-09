/// code : "AAA"
/// lat : "-17.3595"
/// lon : "-145.494"
/// name : "Anaa Airport"
/// city : "Anaa"
/// state : "Tuamotu-Gambier"
/// country : "French Polynesia"
/// woeid : "12512819"
/// tz : "Pacific/Midway"
/// phone : ""
/// type : "Airports"
/// email : ""
/// url : ""
/// runway_length : "4921"
/// elev : "7"
/// icao : "NTGA"
/// direct_flights : "2"
/// carriers : "1"

class AirportModel {
  AirportModel({
    String? code,
    String? lat,
    String? lon,
    String? name,
    String? city,
    String? state,
    String? country,
    String? woeid,
    String? tz,
    String? phone,
    String? type,
    String? email,
    String? url,
    String? runwayLength,
    String? elev,
    String? icao,
    String? directFlights,
    String? carriers,
  }) {
    _code = code;
    _lat = lat;
    _lon = lon;
    _name = name;
    _city = city;
    _state = state;
    _country = country;
    _woeid = woeid;
    _tz = tz;
    _phone = phone;
    _type = type;
    _email = email;
    _url = url;
    _runwayLength = runwayLength;
    _elev = elev;
    _icao = icao;
    _directFlights = directFlights;
    _carriers = carriers;
  }

  AirportModel.fromJson(dynamic json) {
    _code = json['code'];
    _lat = json['lat'];
    _lon = json['lon'];
    _name = json['name'];
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _woeid = json['woeid'];
    _tz = json['tz'];
    _phone = json['phone'];
    _type = json['type'];
    _email = json['email'];
    _url = json['url'];
    _runwayLength = json['runway_length'];
    _elev = json['elev'];
    _icao = json['icao'];
    _directFlights = json['direct_flights'];
    _carriers = json['carriers'];
  }

  String? _code;
  String? _lat;
  String? _lon;
  String? _name;
  String? _city;
  String? _state;
  String? _country;
  String? _woeid;
  String? _tz;
  String? _phone;
  String? _type;
  String? _email;
  String? _url;
  String? _runwayLength;
  String? _elev;
  String? _icao;
  String? _directFlights;
  String? _carriers;

  AirportModel copyWith({
    String? code,
    String? lat,
    String? lon,
    String? name,
    String? city,
    String? state,
    String? country,
    String? woeid,
    String? tz,
    String? phone,
    String? type,
    String? email,
    String? url,
    String? runwayLength,
    String? elev,
    String? icao,
    String? directFlights,
    String? carriers,
  }) =>
      AirportModel(
        code: code ?? _code,
        lat: lat ?? _lat,
        lon: lon ?? _lon,
        name: name ?? _name,
        city: city ?? _city,
        state: state ?? _state,
        country: country ?? _country,
        woeid: woeid ?? _woeid,
        tz: tz ?? _tz,
        phone: phone ?? _phone,
        type: type ?? _type,
        email: email ?? _email,
        url: url ?? _url,
        runwayLength: runwayLength ?? _runwayLength,
        elev: elev ?? _elev,
        icao: icao ?? _icao,
        directFlights: directFlights ?? _directFlights,
        carriers: carriers ?? _carriers,
      );

  String? get code => _code;

  String? get lat => _lat;

  String? get lon => _lon;

  String? get name => _name;

  String? get city => _city;

  String? get state => _state;

  String? get country => _country;

  String? get woeid => _woeid;

  String? get tz => _tz;

  String? get phone => _phone;

  String? get type => _type;

  String? get email => _email;

  String? get url => _url;

  String? get runwayLength => _runwayLength;

  String? get elev => _elev;

  String? get icao => _icao;

  String? get directFlights => _directFlights;

  String? get carriers => _carriers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['lat'] = _lat;
    map['lon'] = _lon;
    map['name'] = _name;
    map['city'] = _city;
    map['state'] = _state;
    map['country'] = _country;
    map['woeid'] = _woeid;
    map['tz'] = _tz;
    map['phone'] = _phone;
    map['type'] = _type;
    map['email'] = _email;
    map['url'] = _url;
    map['runway_length'] = _runwayLength;
    map['elev'] = _elev;
    map['icao'] = _icao;
    map['direct_flights'] = _directFlights;
    map['carriers'] = _carriers;
    return map;
  }
}
