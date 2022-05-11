/// data : [{"chainCode":"AC","iataCode":"PAR","dupeId":700060076,"name":"MAYET","hotelId":"ACPARF58","geoCode":{"latitude":48.84724,"longitude":2.31836},"address":{"countryCode":"FR"}}]

class HotelModel {
  HotelModel({
    List<Data>? data,
  }) {
    _data = data;
  }

  HotelModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  List<Data>? _data;

  HotelModel copyWith({
    List<Data>? data,
  }) =>
      HotelModel(
        data: data ?? _data,
      );

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// chainCode : "AC"
/// iataCode : "PAR"
/// dupeId : 700060076
/// name : "MAYET"
/// hotelId : "ACPARF58"
/// geoCode : {"latitude":48.84724,"longitude":2.31836}
/// address : {"countryCode":"FR"}

class Data {
  Data({
    String? chainCode,
    String? iataCode,
    int? dupeId,
    String? name,
    String? hotelId,
    GeoCode? geoCode,
    Address? address,
  }) {
    _chainCode = chainCode;
    _iataCode = iataCode;
    _dupeId = dupeId;
    _name = name;
    _hotelId = hotelId;
    _geoCode = geoCode;
    _address = address;
  }

  Data.fromJson(dynamic json) {
    _chainCode = json['chainCode'];
    _iataCode = json['iataCode'];
    _dupeId = json['dupeId'];
    _name = json['name'];
    _hotelId = json['hotelId'];
    _geoCode =
        json['geoCode'] != null ? GeoCode.fromJson(json['geoCode']) : null;
    _address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
  }

  String? _chainCode;
  String? _iataCode;
  int? _dupeId;
  String? _name;
  String? _hotelId;
  GeoCode? _geoCode;
  Address? _address;

  Data copyWith({
    String? chainCode,
    String? iataCode,
    int? dupeId,
    String? name,
    String? hotelId,
    GeoCode? geoCode,
    Address? address,
  }) =>
      Data(
        chainCode: chainCode ?? _chainCode,
        iataCode: iataCode ?? _iataCode,
        dupeId: dupeId ?? _dupeId,
        name: name ?? _name,
        hotelId: hotelId ?? _hotelId,
        geoCode: geoCode ?? _geoCode,
        address: address ?? _address,
      );

  String? get chainCode => _chainCode;

  String? get iataCode => _iataCode;

  int? get dupeId => _dupeId;

  String? get name => _name;

  String? get hotelId => _hotelId;

  GeoCode? get geoCode => _geoCode;

  Address? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['chainCode'] = _chainCode;
    map['iataCode'] = _iataCode;
    map['dupeId'] = _dupeId;
    map['name'] = _name;
    map['hotelId'] = _hotelId;
    if (_geoCode != null) {
      map['geoCode'] = _geoCode?.toJson();
    }
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    return map;
  }
}

/// countryCode : "FR"

class Address {
  Address({
    String? countryCode,
  }) {
    _countryCode = countryCode;
  }

  Address.fromJson(dynamic json) {
    _countryCode = json['countryCode'];
  }

  String? _countryCode;

  Address copyWith({
    String? countryCode,
  }) =>
      Address(
        countryCode: countryCode ?? _countryCode,
      );

  String? get countryCode => _countryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['countryCode'] = _countryCode;
    return map;
  }
}

/// latitude : 48.84724
/// longitude : 2.31836

class GeoCode {
  GeoCode({
    double? latitude,
    double? longitude,
  }) {
    _latitude = latitude;
    _longitude = longitude;
  }

  GeoCode.fromJson(dynamic json) {
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }

  double? _latitude;
  double? _longitude;

  GeoCode copyWith({
    double? latitude,
    double? longitude,
  }) =>
      GeoCode(
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
      );

  double? get latitude => _latitude;

  double? get longitude => _longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    return map;
  }
}
