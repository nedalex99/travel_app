///"data": [ { "type": "category-rated-area", "geoCode": { "latitude": 41.397158, "longitude": 2.160873 }, "radius": 200, "categoryScores": {   "sight": { "overall": 87,"historical": 83, "beachAndPark": 0 }, "restaurant": { "overall": 92, "vegetarian": 61 }, "shopping": { "overall": 96, "luxury": 96 }, "nightLife": { "overall": 86 } } }, ],

///{ "type": "category-rated-area", "geoCode": { "latitude": 41.397158, "longitude": 2.160873 }, "radius": 200,
/// "categoryScores": {   "sight": { "overall": 87,"historical": 83, "beachAndPark": 0 }, "restaurant": { "overall": 92, "vegetarian": 61 }, "shopping": { "overall": 96, "luxury": 96 }, "nightLife": { "overall": 86 } } },

class LocationScoreModel {
  LocationScoreModel({
    String? type,
    CategoryScores? categoryScores,
  }) {
    _type = type;
    _categoryScores = categoryScores;
  }

  LocationScoreModel.fromJson(dynamic json) {
    _type = json['meta'];
    _categoryScores = json['categoryScores'] != null
        ? CategoryScores.fromJson(json["categoryScores"])
        : null;
  }

  String? _type;
  CategoryScores? _categoryScores;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_type != null) {
      map['type'] = _type;
    }
    if (_categoryScores != null) {
      map['categoryScores'] = _categoryScores?.toJson();
    }
    return map;
  }
}

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

  NightLife? get nightLife => _nightLife;

  Shopping? get shopping => _shopping;

  Restaurant? get restaurant => _restaurant;

  Sight? get sight => _sight;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_nightLife != null) {
      map['nightLife'] = _nightLife?.toJson();
    }
    if (_shopping != null) {
      map['shopping'] = _shopping?.toJson();
    }
    if (_restaurant != null) {
      map['restaurant'] = _restaurant?.toJson();
    }
    if (_sight != null) {
      map['sight'] = _sight?.toJson();
    }
    return map;
  }
}

class Sight {
  Sight({
    BeachAndPark? beachAndPark,
  }) {
    _beachAndPark = beachAndPark;
  }

  Sight.fromJson(dynamic json) {
    _beachAndPark = json['beachAndPark'];
  }

  BeachAndPark? _beachAndPark;

  Sight copyWith({BeachAndPark? beachAndPark}) => Sight(
        beachAndPark: beachAndPark ?? _beachAndPark,
      );

  BeachAndPark? get beachAndPark => _beachAndPark;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['overall'] = _beachAndPark;
    return map;
  }
}

class BeachAndPark {
  BeachAndPark({
    int? note,
  }) {
    _note = note;
  }

  BeachAndPark.fromJson(dynamic json) {
    _note = json['beachAndPark'];
  }

  int? _note;

  BeachAndPark copyWith({int? note}) => BeachAndPark(
        note: note ?? _note,
      );

  int? get note => _note;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['beachAndPark'] = _note;
    return map;
  }
}

class Restaurant {
  Restaurant({
    Overall? overall,
  }) {
    _overall = overall;
  }

  Restaurant.fromJson(dynamic json) {
    _overall = json['overall'];
  }

  Overall? _overall;

  Restaurant copyWith({Overall? overall}) => Restaurant(
        overall: overall ?? _overall,
      );

  Overall? get overall => _overall;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['overall'] = _overall;
    return map;
  }
}

class Shopping {
  Shopping({
    Overall? overall,
  }) {
    _overall = overall;
  }

  Shopping.fromJson(dynamic json) {
    _overall = json['overall'];
  }

  Overall? _overall;

  Shopping copyWith({Overall? overall}) => Shopping(
        overall: overall ?? _overall,
      );

  Overall? get overall => _overall;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['overall'] = _overall;
    return map;
  }
}

class NightLife {
  NightLife({
    Overall? overall,
  }) {
    _overall = overall;
  }

  NightLife.fromJson(dynamic json) {
    _overall = json['overall'];
  }

  Overall? _overall;

  NightLife copyWith({Overall? overall}) => NightLife(
        overall: overall ?? _overall,
      );

  Overall? get overall => _overall;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['overall'] = _overall;
    return map;
  }
}

class Overall {
  Overall({
    int? note,
  }) {
    _note = note;
  }

  Overall.fromJson(dynamic json) {
    _note = json['overall'];
  }

  int? _note;

  Overall copyWith({
    int? note,
  }) =>
      Overall(
        note: note ?? _note,
      );

  int? get note => _note;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['overall'] = _note;
    return map;
  }
}
