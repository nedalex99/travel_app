/// type : "category-rated-area"
/// geoCode : {"latitude":41.397158,"longitude":2.160873}
/// radius : 200
/// categoryScores : {"sight":{"overall":87,"historical":83,"beachAndPark":0},"restaurant":{"overall":92,"vegetarian":61},"shopping":{"overall":96,"luxury":96},"nightLife":{"overall":86}}

class LocationScoreModel {
  LocationScoreModel({
    String? type,
    GeoCode? geoCode,
    int? radius,
    CategoryScores? categoryScores,
  }) {
    _type = type;
    _geoCode = geoCode;
    _radius = radius;
    _categoryScores = categoryScores;
  }

  LocationScoreModel.fromJson(dynamic json) {
    _type = json['type'];
    _geoCode =
        json['geoCode'] != null ? GeoCode.fromJson(json['geoCode']) : null;
    _radius = json['radius'];
    _categoryScores = json['categoryScores'] != null
        ? CategoryScores.fromJson(json['categoryScores'])
        : null;
  }

  String? _type;
  GeoCode? _geoCode;
  int? _radius;
  CategoryScores? _categoryScores;

  LocationScoreModel copyWith({
    String? type,
    GeoCode? geoCode,
    int? radius,
    CategoryScores? categoryScores,
  }) =>
      LocationScoreModel(
        type: type ?? _type,
        geoCode: geoCode ?? _geoCode,
        radius: radius ?? _radius,
        categoryScores: categoryScores ?? _categoryScores,
      );

  String? get type => _type;

  GeoCode? get geoCode => _geoCode;

  int? get radius => _radius;

  CategoryScores? get categoryScores => _categoryScores;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    if (_geoCode != null) {
      map['geoCode'] = _geoCode?.toJson();
    }
    map['radius'] = _radius;
    if (_categoryScores != null) {
      map['categoryScores'] = _categoryScores?.toJson();
    }
    return map;
  }
}

/// sight : {"overall":87,"historical":83,"beachAndPark":0}
/// restaurant : {"overall":92,"vegetarian":61}
/// shopping : {"overall":96,"luxury":96}
/// nightLife : {"overall":86}

class CategoryScores {
  CategoryScores({
    Sight? sight,
    Restaurant? restaurant,
    Shopping? shopping,
    NightLife? nightLife,
  }) {
    _sight = sight;
    _restaurant = restaurant;
    _shopping = shopping;
    _nightLife = nightLife;
  }

  CategoryScores.fromJson(dynamic json) {
    _sight = json['sight'] != null ? Sight.fromJson(json['sight']) : null;
    _restaurant = json['restaurant'] != null
        ? Restaurant.fromJson(json['restaurant'])
        : null;
    _shopping =
        json['shopping'] != null ? Shopping.fromJson(json['shopping']) : null;
    _nightLife = json['nightLife'] != null
        ? NightLife.fromJson(json['nightLife'])
        : null;
  }

  Sight? _sight;
  Restaurant? _restaurant;
  Shopping? _shopping;
  NightLife? _nightLife;

  CategoryScores copyWith({
    Sight? sight,
    Restaurant? restaurant,
    Shopping? shopping,
    NightLife? nightLife,
  }) =>
      CategoryScores(
        sight: sight ?? _sight,
        restaurant: restaurant ?? _restaurant,
        shopping: shopping ?? _shopping,
        nightLife: nightLife ?? _nightLife,
      );

  Sight? get sight => _sight;

  Restaurant? get restaurant => _restaurant;

  Shopping? get shopping => _shopping;

  NightLife? get nightLife => _nightLife;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_sight != null) {
      map['sight'] = _sight?.toJson();
    }
    if (_restaurant != null) {
      map['restaurant'] = _restaurant?.toJson();
    }
    if (_shopping != null) {
      map['shopping'] = _shopping?.toJson();
    }
    if (_nightLife != null) {
      map['nightLife'] = _nightLife?.toJson();
    }
    return map;
  }
}

/// overall : 86

class NightLife {
  NightLife({
    int? overall,
  }) {
    _overall = overall;
  }

  NightLife.fromJson(dynamic json) {
    _overall = json['overall'];
  }

  int? _overall;

  NightLife copyWith({
    int? overall,
  }) =>
      NightLife(
        overall: overall ?? _overall,
      );

  int? get overall => _overall;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['overall'] = _overall;
    return map;
  }
}

/// overall : 96
/// luxury : 96

class Shopping {
  Shopping({
    int? overall,
    int? luxury,
  }) {
    _overall = overall;
    _luxury = luxury;
  }

  Shopping.fromJson(dynamic json) {
    _overall = json['overall'];
    _luxury = json['luxury'];
  }

  int? _overall;
  int? _luxury;

  Shopping copyWith({
    int? overall,
    int? luxury,
  }) =>
      Shopping(
        overall: overall ?? _overall,
        luxury: luxury ?? _luxury,
      );

  int? get overall => _overall;

  int? get luxury => _luxury;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['overall'] = _overall;
    map['luxury'] = _luxury;
    return map;
  }
}

/// overall : 92
/// vegetarian : 61

class Restaurant {
  Restaurant({
    int? overall,
    int? vegetarian,
  }) {
    _overall = overall;
    _vegetarian = vegetarian;
  }

  Restaurant.fromJson(dynamic json) {
    _overall = json['overall'];
    _vegetarian = json['vegetarian'];
  }

  int? _overall;
  int? _vegetarian;

  Restaurant copyWith({
    int? overall,
    int? vegetarian,
  }) =>
      Restaurant(
        overall: overall ?? _overall,
        vegetarian: vegetarian ?? _vegetarian,
      );

  int? get overall => _overall;

  int? get vegetarian => _vegetarian;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['overall'] = _overall;
    map['vegetarian'] = _vegetarian;
    return map;
  }
}

/// overall : 87
/// historical : 83
/// beachAndPark : 0

class Sight {
  Sight({
    int? overall,
    int? historical,
    int? beachAndPark,
  }) {
    _overall = overall;
    _historical = historical;
    _beachAndPark = beachAndPark;
  }

  Sight.fromJson(dynamic json) {
    _overall = json['overall'];
    _historical = json['historical'];
    _beachAndPark = json['beachAndPark'];
  }

  int? _overall;
  int? _historical;
  int? _beachAndPark;

  Sight copyWith({
    int? overall,
    int? historical,
    int? beachAndPark,
  }) =>
      Sight(
        overall: overall ?? _overall,
        historical: historical ?? _historical,
        beachAndPark: beachAndPark ?? _beachAndPark,
      );

  int? get overall => _overall;

  int? get historical => _historical;

  int? get beachAndPark => _beachAndPark;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['overall'] = _overall;
    map['historical'] = _historical;
    map['beachAndPark'] = _beachAndPark;
    return map;
  }
}

/// latitude : 41.397158
/// longitude : 2.160873

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
