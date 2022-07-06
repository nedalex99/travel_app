/// id : "4251"
/// type : "activity"
/// self : {"href":"https://test.api.amadeus.com/v1/shopping/activities/4251","methods":["GET"]}
/// name : "Sagrada Familia fast-track tickets and guided visit"
/// shortDescription : "Explore unfinished masterpiece with fast-track tickets. Book your guided visit with Musement and discover one of the most visited buildings in the world!"
/// geoCode : {"latitude":"41.403565","longitude":"2.170429"}
/// rating : "4.400000"
/// pictures : ["https://images.musement.com/cover/0002/37/thumb_136083_cover_header.jpeg?w=500"]
/// bookingLink : "https://b2c.mla.cloud/c/kYbcrf6F?c=2WxbgL36"
/// price : {"currencyCode":"EUR","amount":"39.00"}

class ToursAndActivitiesModel {
  ToursAndActivitiesModel({
    String? id,
    String? type,
    Self? self,
    String? name,
    String? shortDescription,
    GeoCode? geoCode,
    String? rating,
    List<String>? pictures,
    String? bookingLink,
    Price? price,
  }) {
    _id = id;
    _type = type;
    _self = self;
    _name = name;
    _shortDescription = shortDescription;
    _geoCode = geoCode;
    _rating = rating;
    _pictures = pictures;
    _bookingLink = bookingLink;
    _price = price;
  }

  ToursAndActivitiesModel.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _self = json['self'] != null ? Self.fromJson(json['self']) : null;
    _name = json['name'];
    _shortDescription = json['shortDescription'];
    _geoCode =
        json['geoCode'] != null ? GeoCode.fromJson(json['geoCode']) : null;
    _rating = json['rating'];
    _pictures = json['pictures'] != null ? json['pictures'].cast<String>() : [];
    _bookingLink = json['bookingLink'];
    _price = json['price'] != null ? Price.fromJson(json['price']) : null;
  }

  String? _id;
  String? _type;
  Self? _self;
  String? _name;
  String? _shortDescription;
  GeoCode? _geoCode;
  String? _rating;
  List<String>? _pictures;
  String? _bookingLink;
  Price? _price;

  ToursAndActivitiesModel copyWith({
    String? id,
    String? type,
    Self? self,
    String? name,
    String? shortDescription,
    GeoCode? geoCode,
    String? rating,
    List<String>? pictures,
    String? bookingLink,
    Price? price,
  }) =>
      ToursAndActivitiesModel(
        id: id ?? _id,
        type: type ?? _type,
        self: self ?? _self,
        name: name ?? _name,
        shortDescription: shortDescription ?? _shortDescription,
        geoCode: geoCode ?? _geoCode,
        rating: rating ?? _rating,
        pictures: pictures ?? _pictures,
        bookingLink: bookingLink ?? _bookingLink,
        price: price ?? _price,
      );

  String? get id => _id;

  String? get type => _type;

  Self? get self => _self;

  String? get name => _name;

  String? get shortDescription => _shortDescription;

  GeoCode? get geoCode => _geoCode;

  String? get rating => _rating;

  List<String>? get pictures => _pictures;

  String? get bookingLink => _bookingLink;

  Price? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    if (_self != null) {
      map['self'] = _self?.toJson();
    }
    map['name'] = _name;
    map['shortDescription'] = _shortDescription;
    if (_geoCode != null) {
      map['geoCode'] = _geoCode?.toJson();
    }
    map['rating'] = _rating;
    map['pictures'] = _pictures;
    map['bookingLink'] = _bookingLink;
    if (_price != null) {
      map['price'] = _price?.toJson();
    }
    return map;
  }
}

/// currencyCode : "EUR"
/// amount : "39.00"

class Price {
  Price({
    String? currencyCode,
    String? amount,
  }) {
    _currencyCode = currencyCode;
    _amount = amount;
  }

  Price.fromJson(dynamic json) {
    _currencyCode = json['currencyCode'];
    _amount = json['amount'];
  }

  String? _currencyCode;
  String? _amount;

  Price copyWith({
    String? currencyCode,
    String? amount,
  }) =>
      Price(
        currencyCode: currencyCode ?? _currencyCode,
        amount: amount ?? _amount,
      );

  String? get currencyCode => _currencyCode;

  String? get amount => _amount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currencyCode'] = _currencyCode;
    map['amount'] = _amount;
    return map;
  }
}

/// latitude : "41.403565"
/// longitude : "2.170429"

class GeoCode {
  GeoCode({
    String? latitude,
    String? longitude,
  }) {
    _latitude = latitude;
    _longitude = longitude;
  }

  GeoCode.fromJson(dynamic json) {
    _latitude = json['latitude'].toString();
    _longitude = json['longitude'].toString();
  }

  String? _latitude;
  String? _longitude;

  GeoCode copyWith({
    String? latitude,
    String? longitude,
  }) =>
      GeoCode(
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
      );

  String? get latitude => _latitude;

  String? get longitude => _longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    return map;
  }
}

/// href : "https://test.api.amadeus.com/v1/shopping/activities/4251"
/// methods : ["GET"]

class Self {
  Self({
    String? href,
    List<String>? methods,
  }) {
    _href = href;
    _methods = methods;
  }

  Self.fromJson(dynamic json) {
    _href = json['href'];
    _methods = json['methods'] != null ? json['methods'].cast<String>() : [];
  }

  String? _href;
  List<String>? _methods;

  Self copyWith({
    String? href,
    List<String>? methods,
  }) =>
      Self(
        href: href ?? _href,
        methods: methods ?? _methods,
      );

  String? get href => _href;

  List<String>? get methods => _methods;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = _href;
    map['methods'] = _methods;
    return map;
  }
}
