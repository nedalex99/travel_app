import 'package:travel_app/model/hotel_model.dart';

///data": [{"subtype": "CITY","name": "Nice","iataCode": "NCE","geoCode": {"latitude": 43.658411,"longitude": 7.215872},"type": "recommended-location","relevance": 0.97843487},

///{"subtype": "CITY","name": "Nice","iataCode": "NCE","geoCode": {"latitude": 43.658411,"longitude": 7.215872},"type": "recommended-location","relevance": 0.97843487}

class RecommendationModel {
  RecommendationModel({
    String? subtype,
    String? name,
    String? iataCode,
    GeoCode? geoCode,
    int? relevance,
  }) {
    _subtype = subtype;
    _name = name;
    _iataCode = iataCode;
    _geoCode = geoCode;
    _relevance = relevance;
  }

  RecommendationModel.fromJson(dynamic json) {
    _subtype = json['subtype'];
    _name = json['name'];
    _iataCode = json['iataCode'];
    _geoCode =
    json['geoCode'] != null ? GeoCode.fromJson(json['geoCode']) : null;
    _relevance = json['relevance'];
  }

  String? _subtype;
  String? _name;
  String? _iataCode;
  GeoCode? _geoCode;
  int? _relevance;

  RecommendationModel copyWith({
    String? subtype,
    String? name,
    String? iataCode,
    GeoCode? geoCode,
    int? relevance,
  }) =>
      RecommendationModel(
        subtype: subtype ?? _subtype,
        name: name ?? _name,
        iataCode: iataCode ?? _iataCode,
        geoCode: geoCode ?? _geoCode,
        relevance: relevance ?? _relevance,
      );

  String? get subtype => _subtype;

  String? get name => _name;

  String? get iataCode => _iataCode;

  GeoCode? get geoCode => _geoCode;

  int? get relevance => _relevance;



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['chainCode'] = _subtype;
    map['name'] = _name;
    map['iataCode'] = _iataCode;
    if (_geoCode != null) {
      map['geoCode'] = _geoCode?.toJson();
    }
    map['address'] = _relevance;

    return map;
  }
}
