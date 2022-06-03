import 'dart:convert';
/// subtype : "CITY"
/// name : "Istanbul"
/// iataCode : "IST"
/// geoCode : {"latitude":41.2629,"longitude":28.742420000000003}
/// type : "recommended-location"
/// relevance : 0.91135847

RecommendationModel recommFromJson(String str) => RecommendationModel.fromJson(json.decode(str));
String recommToJson(RecommendationModel data) => json.encode(data.toJson());
class RecommendationModel {
  RecommendationModel({
    String? subtype,
    String? name,
    String? iataCode,
    GeoCode? geoCode,
    String? type,
    double? relevance,}){
    _subtype = subtype;
    _name = name;
    _iataCode = iataCode;
    _geoCode = geoCode;
    _type = type;
    _relevance = relevance;
  }

  RecommendationModel.fromJson(dynamic json) {
    _subtype = json['subtype'];
    _name = json['name'];
    _iataCode = json['iataCode'];
    _geoCode = json['geoCode'] != null ? GeoCode.fromJson(json['geoCode']) : null;
    _type = json['type'];
    _relevance = json['relevance'];
  }
  String? _subtype;
  String? _name;
  String? _iataCode;
  GeoCode? _geoCode;
  String? _type;
  double? _relevance;
  RecommendationModel copyWith({  String? subtype,
    String? name,
    String? iataCode,
    GeoCode? geoCode,
    String? type,
    double? relevance,
  }) => RecommendationModel(  subtype: subtype ?? _subtype,
    name: name ?? _name,
    iataCode: iataCode ?? _iataCode,
    geoCode: geoCode ?? _geoCode,
    type: type ?? _type,
    relevance: relevance ?? _relevance,
  );
  String? get subtype => _subtype;
  String? get name => _name;
  String? get iataCode => _iataCode;
  GeoCode? get geoCode => _geoCode;
  String? get type => _type;
  double? get relevance => _relevance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subtype'] = _subtype;
    map['name'] = _name;
    map['iataCode'] = _iataCode;
    if (_geoCode != null) {
      map['geoCode'] = _geoCode?.toJson();
    }
    map['type'] = _type;
    map['relevance'] = _relevance;
    return map;
  }

}

/// latitude : 41.2629
/// longitude : 28.742420000000003

GeoCode geoCodeFromJson(String str) => GeoCode.fromJson(json.decode(str));
String geoCodeToJson(GeoCode data) => json.encode(data.toJson());
class GeoCode {
  GeoCode({
    double? latitude,
    double? longitude,}){
    _latitude = latitude;
    _longitude = longitude;
  }

  GeoCode.fromJson(dynamic json) {
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }
  double? _latitude;
  double? _longitude;
  GeoCode copyWith({  double? latitude,
    double? longitude,
  }) => GeoCode(  latitude: latitude ?? _latitude,
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