/// type : "hotel-offers"
/// hotel : {"type":"hotel","hotelId":"HSORYAAW","chainCode":"HS","dupeId":"700004907","name":"Austin's Arts et Métiers","rating":"3","cityCode":"ORY","latitude":48.86591,"longitude":2.35704,"hotelDistance":{"distance":1.6,"distanceUnit":"KM"},"address":{"lines":["6, RUE MONTGOLFIER"],"postalCode":"75003","cityName":"PARIS","countryCode":"FR"},"contact":{"phone":"(33) 142771761","fax":"(33) 142775543","email":"austins.amhotel@wanadoo.fr"},"description":{"lang":"en","text":"Well-equipped rooms are offered by the hotel Austin's Arts et Métiers in Paris. The services of the hotel and its personnel provide a relaxing and comfortable stay. The reception desk of the hotel Austin's Arts et Métiers is available 24 hours a day."},"amenities":["24_HOUR_FRONT_DESK","MULTILINGUAL_STAFF","ELEVATOR","INTERNET_SERVICES","SAFE_DEPOSIT_BOX","VENDING_MACHINES","CONCIERGE","DRIVING_RANGE","NIGHT_CLUB","WIRELESS_CONNECTIVITY","COFFEE_SHOP","CONCIERGE","PORTER/BELLBOY","FIRE_DETECTORS","VIDEO_SURVEILANCE"],"media":[{"uri":"http://uat.multimediarepository.testing.amadeus.com/cmr/retrieve/hotel/489CB230736E40C4B3F56A26A0062E10","category":"EXTERIOR"}]}
/// available : true
/// offers : [{"id":"R77GA2ISQG","checkInDate":"2022-05-18","checkOutDate":"2022-05-19","rateCode":"RAC","commission":{"percentage":"4.00"},"boardType":"BREAKFAST","room":{"type":"ROH","typeEstimated":{"category":"STANDARD_ROOM"},"description":{"text":"Event-Rate\nStandard room A standard room consists of a room with shower-toilet or bathtub-toilet."}},"guests":{"adults":1},"price":{"currency":"EUR","total":"333.00","variations":{"average":{"total":"333.00"},"changes":[{"startDate":"2022-05-18","endDate":"2022-05-19","total":"333.00"}]}},"policies":{"guarantee":{"acceptedPayments":{"creditCards":["AX","CA","DC","DN","JC","MC","VI"],"methods":["CREDIT_CARD"]}},"paymentType":"guarantee","cancellation":{"deadline":"2022-05-16T18:42:00+02:00"}},"self":"https://test.api.amadeus.com/v2/shopping/hotel-offers/R77GA2ISQG","cancelPolicyHash":"7C4C8CEDA593FE3415CFBBA52A3D90BA7F6311C0536C02D788F3BF441EE7D3D6"}]
/// self : "https://test.api.amadeus.com/v2/shopping/hotel-offers/by-hotel?hotelId=HSORYAAW"

class HotelModel {
  HotelModel({
    String? type,
    Hotel? hotel,
    bool? available,
    List<Offers>? offers,
    String? self,
  }) {
    _type = type;
    _hotel = hotel;
    _available = available;
    _offers = offers;
    _self = self;
  }

  HotelModel.fromJson(dynamic json) {
    _type = json['type'];
    _hotel = json['hotel'] != null ? Hotel.fromJson(json['hotel']) : null;
    _available = json['available'];
    if (json['offers'] != null) {
      _offers = [];
      json['offers'].forEach((v) {
        _offers?.add(Offers.fromJson(v));
      });
    }
    _self = json['self'];
  }

  String? _type;
  Hotel? _hotel;
  bool? _available;
  List<Offers>? _offers;
  String? _self;

  HotelModel copyWith({
    String? type,
    Hotel? hotel,
    bool? available,
    List<Offers>? offers,
    String? self,
  }) =>
      HotelModel(
        type: type ?? _type,
        hotel: hotel ?? _hotel,
        available: available ?? _available,
        offers: offers ?? _offers,
        self: self ?? _self,
      );

  String? get type => _type;

  Hotel? get hotel => _hotel;

  bool? get available => _available;

  List<Offers>? get offers => _offers;

  String? get self => _self;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    if (_hotel != null) {
      map['hotel'] = _hotel?.toJson();
    }
    map['available'] = _available;
    if (_offers != null) {
      map['offers'] = _offers?.map((v) => v.toJson()).toList();
    }
    map['self'] = _self;
    return map;
  }
}

/// id : "R77GA2ISQG"
/// checkInDate : "2022-05-18"
/// checkOutDate : "2022-05-19"
/// rateCode : "RAC"
/// commission : {"percentage":"4.00"}
/// boardType : "BREAKFAST"
/// room : {"type":"ROH","typeEstimated":{"category":"STANDARD_ROOM"},"description":{"text":"Event-Rate\nStandard room A standard room consists of a room with shower-toilet or bathtub-toilet."}}
/// guests : {"adults":1}
/// price : {"currency":"EUR","total":"333.00","variations":{"average":{"total":"333.00"},"changes":[{"startDate":"2022-05-18","endDate":"2022-05-19","total":"333.00"}]}}
/// policies : {"guarantee":{"acceptedPayments":{"creditCards":["AX","CA","DC","DN","JC","MC","VI"],"methods":["CREDIT_CARD"]}},"paymentType":"guarantee","cancellation":{"deadline":"2022-05-16T18:42:00+02:00"}}
/// self : "https://test.api.amadeus.com/v2/shopping/hotel-offers/R77GA2ISQG"
/// cancelPolicyHash : "7C4C8CEDA593FE3415CFBBA52A3D90BA7F6311C0536C02D788F3BF441EE7D3D6"

class Offers {
  Offers({
    String? id,
    String? checkInDate,
    String? checkOutDate,
    String? rateCode,
    Commission? commission,
    String? boardType,
    Room? room,
    Guests? guests,
    Price? price,
    Policies? policies,
    String? self,
    String? cancelPolicyHash,
  }) {
    _id = id;
    _checkInDate = checkInDate;
    _checkOutDate = checkOutDate;
    _rateCode = rateCode;
    _commission = commission;
    _boardType = boardType;
    _room = room;
    _guests = guests;
    _price = price;
    _policies = policies;
    _self = self;
    _cancelPolicyHash = cancelPolicyHash;
  }

  Offers.fromJson(dynamic json) {
    _id = json['id'];
    _checkInDate = json['checkInDate'];
    _checkOutDate = json['checkOutDate'];
    _rateCode = json['rateCode'];
    _commission = json['commission'] != null
        ? Commission.fromJson(json['commission'])
        : null;
    _boardType = json['boardType'];
    _room = json['room'] != null ? Room.fromJson(json['room']) : null;
    _guests = json['guests'] != null ? Guests.fromJson(json['guests']) : null;
    _price = json['price'] != null ? Price.fromJson(json['price']) : null;
    _policies =
        json['policies'] != null ? Policies.fromJson(json['policies']) : null;
    _self = json['self'];
    _cancelPolicyHash = json['cancelPolicyHash'];
  }

  String? _id;
  String? _checkInDate;
  String? _checkOutDate;
  String? _rateCode;
  Commission? _commission;
  String? _boardType;
  Room? _room;
  Guests? _guests;
  Price? _price;
  Policies? _policies;
  String? _self;
  String? _cancelPolicyHash;

  Offers copyWith({
    String? id,
    String? checkInDate,
    String? checkOutDate,
    String? rateCode,
    Commission? commission,
    String? boardType,
    Room? room,
    Guests? guests,
    Price? price,
    Policies? policies,
    String? self,
    String? cancelPolicyHash,
  }) =>
      Offers(
        id: id ?? _id,
        checkInDate: checkInDate ?? _checkInDate,
        checkOutDate: checkOutDate ?? _checkOutDate,
        rateCode: rateCode ?? _rateCode,
        commission: commission ?? _commission,
        boardType: boardType ?? _boardType,
        room: room ?? _room,
        guests: guests ?? _guests,
        price: price ?? _price,
        policies: policies ?? _policies,
        self: self ?? _self,
        cancelPolicyHash: cancelPolicyHash ?? _cancelPolicyHash,
      );

  String? get id => _id;

  String? get checkInDate => _checkInDate;

  String? get checkOutDate => _checkOutDate;

  String? get rateCode => _rateCode;

  Commission? get commission => _commission;

  String? get boardType => _boardType;

  Room? get room => _room;

  Guests? get guests => _guests;

  Price? get price => _price;

  Policies? get policies => _policies;

  String? get self => _self;

  String? get cancelPolicyHash => _cancelPolicyHash;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['checkInDate'] = _checkInDate;
    map['checkOutDate'] = _checkOutDate;
    map['rateCode'] = _rateCode;
    if (_commission != null) {
      map['commission'] = _commission?.toJson();
    }
    map['boardType'] = _boardType;
    if (_room != null) {
      map['room'] = _room?.toJson();
    }
    if (_guests != null) {
      map['guests'] = _guests?.toJson();
    }
    if (_price != null) {
      map['price'] = _price?.toJson();
    }
    if (_policies != null) {
      map['policies'] = _policies?.toJson();
    }
    map['self'] = _self;
    map['cancelPolicyHash'] = _cancelPolicyHash;
    return map;
  }
}

/// guarantee : {"acceptedPayments":{"creditCards":["AX","CA","DC","DN","JC","MC","VI"],"methods":["CREDIT_CARD"]}}
/// paymentType : "guarantee"
/// cancellation : {"deadline":"2022-05-16T18:42:00+02:00"}

class Policies {
  Policies({
    Guarantee? guarantee,
    String? paymentType,
    Cancellation? cancellation,
  }) {
    _guarantee = guarantee;
    _paymentType = paymentType;
    _cancellation = cancellation;
  }

  Policies.fromJson(dynamic json) {
    _guarantee = json['guarantee'] != null
        ? Guarantee.fromJson(json['guarantee'])
        : null;
    _paymentType = json['paymentType'];
    _cancellation = json['cancellation'] != null
        ? Cancellation.fromJson(json['cancellation'])
        : null;
  }

  Guarantee? _guarantee;
  String? _paymentType;
  Cancellation? _cancellation;

  Policies copyWith({
    Guarantee? guarantee,
    String? paymentType,
    Cancellation? cancellation,
  }) =>
      Policies(
        guarantee: guarantee ?? _guarantee,
        paymentType: paymentType ?? _paymentType,
        cancellation: cancellation ?? _cancellation,
      );

  Guarantee? get guarantee => _guarantee;

  String? get paymentType => _paymentType;

  Cancellation? get cancellation => _cancellation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_guarantee != null) {
      map['guarantee'] = _guarantee?.toJson();
    }
    map['paymentType'] = _paymentType;
    if (_cancellation != null) {
      map['cancellation'] = _cancellation?.toJson();
    }
    return map;
  }
}

/// deadline : "2022-05-16T18:42:00+02:00"

class Cancellation {
  Cancellation({
    String? deadline,
  }) {
    _deadline = deadline;
  }

  Cancellation.fromJson(dynamic json) {
    _deadline = json['deadline'];
  }

  String? _deadline;

  Cancellation copyWith({
    String? deadline,
  }) =>
      Cancellation(
        deadline: deadline ?? _deadline,
      );

  String? get deadline => _deadline;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['deadline'] = _deadline;
    return map;
  }
}

/// acceptedPayments : {"creditCards":["AX","CA","DC","DN","JC","MC","VI"],"methods":["CREDIT_CARD"]}

class Guarantee {
  Guarantee({
    AcceptedPayments? acceptedPayments,
  }) {
    _acceptedPayments = acceptedPayments;
  }

  Guarantee.fromJson(dynamic json) {
    _acceptedPayments = json['acceptedPayments'] != null
        ? AcceptedPayments.fromJson(json['acceptedPayments'])
        : null;
  }

  AcceptedPayments? _acceptedPayments;

  Guarantee copyWith({
    AcceptedPayments? acceptedPayments,
  }) =>
      Guarantee(
        acceptedPayments: acceptedPayments ?? _acceptedPayments,
      );

  AcceptedPayments? get acceptedPayments => _acceptedPayments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_acceptedPayments != null) {
      map['acceptedPayments'] = _acceptedPayments?.toJson();
    }
    return map;
  }
}

/// creditCards : ["AX","CA","DC","DN","JC","MC","VI"]
/// methods : ["CREDIT_CARD"]

class AcceptedPayments {
  AcceptedPayments({
    List<String>? creditCards,
    List<String>? methods,
  }) {
    _creditCards = creditCards;
    _methods = methods;
  }

  AcceptedPayments.fromJson(dynamic json) {
    _creditCards =
        json['creditCards'] != null ? json['creditCards'].cast<String>() : [];
    _methods = json['methods'] != null ? json['methods'].cast<String>() : [];
  }

  List<String>? _creditCards;
  List<String>? _methods;

  AcceptedPayments copyWith({
    List<String>? creditCards,
    List<String>? methods,
  }) =>
      AcceptedPayments(
        creditCards: creditCards ?? _creditCards,
        methods: methods ?? _methods,
      );

  List<String>? get creditCards => _creditCards;

  List<String>? get methods => _methods;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['creditCards'] = _creditCards;
    map['methods'] = _methods;
    return map;
  }
}

/// currency : "EUR"
/// total : "333.00"
/// variations : {"average":{"total":"333.00"},"changes":[{"startDate":"2022-05-18","endDate":"2022-05-19","total":"333.00"}]}

class Price {
  Price({
    String? currency,
    String? total,
    Variations? variations,
  }) {
    _currency = currency;
    _total = total;
    _variations = variations;
  }

  Price.fromJson(dynamic json) {
    _currency = json['currency'];
    _total = json['total'];
    _variations = json['variations'] != null
        ? Variations.fromJson(json['variations'])
        : null;
  }

  String? _currency;
  String? _total;
  Variations? _variations;

  Price copyWith({
    String? currency,
    String? total,
    Variations? variations,
  }) =>
      Price(
        currency: currency ?? _currency,
        total: total ?? _total,
        variations: variations ?? _variations,
      );

  String? get currency => _currency;

  String? get total => _total;

  Variations? get variations => _variations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currency'] = _currency;
    map['total'] = _total;
    if (_variations != null) {
      map['variations'] = _variations?.toJson();
    }
    return map;
  }
}

/// average : {"total":"333.00"}
/// changes : [{"startDate":"2022-05-18","endDate":"2022-05-19","total":"333.00"}]

class Variations {
  Variations({
    Average? average,
    List<Changes>? changes,
  }) {
    _average = average;
    _changes = changes;
  }

  Variations.fromJson(dynamic json) {
    _average =
        json['average'] != null ? Average.fromJson(json['average']) : null;
    if (json['changes'] != null) {
      _changes = [];
      json['changes'].forEach((v) {
        _changes?.add(Changes.fromJson(v));
      });
    }
  }

  Average? _average;
  List<Changes>? _changes;

  Variations copyWith({
    Average? average,
    List<Changes>? changes,
  }) =>
      Variations(
        average: average ?? _average,
        changes: changes ?? _changes,
      );

  Average? get average => _average;

  List<Changes>? get changes => _changes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_average != null) {
      map['average'] = _average?.toJson();
    }
    if (_changes != null) {
      map['changes'] = _changes?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// startDate : "2022-05-18"
/// endDate : "2022-05-19"
/// total : "333.00"

class Changes {
  Changes({
    String? startDate,
    String? endDate,
    String? total,
  }) {
    _startDate = startDate;
    _endDate = endDate;
    _total = total;
  }

  Changes.fromJson(dynamic json) {
    _startDate = json['startDate'];
    _endDate = json['endDate'];
    _total = json['total'];
  }

  String? _startDate;
  String? _endDate;
  String? _total;

  Changes copyWith({
    String? startDate,
    String? endDate,
    String? total,
  }) =>
      Changes(
        startDate: startDate ?? _startDate,
        endDate: endDate ?? _endDate,
        total: total ?? _total,
      );

  String? get startDate => _startDate;

  String? get endDate => _endDate;

  String? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['startDate'] = _startDate;
    map['endDate'] = _endDate;
    map['total'] = _total;
    return map;
  }
}

/// total : "333.00"

class Average {
  Average({
    String? total,
  }) {
    _total = total;
  }

  Average.fromJson(dynamic json) {
    _total = json['total'];
  }

  String? _total;

  Average copyWith({
    String? total,
  }) =>
      Average(
        total: total ?? _total,
      );

  String? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    return map;
  }
}

/// adults : 1

class Guests {
  Guests({
    int? adults,
  }) {
    _adults = adults;
  }

  Guests.fromJson(dynamic json) {
    _adults = json['adults'];
  }

  int? _adults;

  Guests copyWith({
    int? adults,
  }) =>
      Guests(
        adults: adults ?? _adults,
      );

  int? get adults => _adults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adults'] = _adults;
    return map;
  }
}

/// type : "ROH"
/// typeEstimated : {"category":"STANDARD_ROOM"}
/// description : {"text":"Event-Rate\nStandard room A standard room consists of a room with shower-toilet or bathtub-toilet."}

class Room {
  Room({
    String? type,
    TypeEstimated? typeEstimated,
    Description? description,
  }) {
    _type = type;
    _typeEstimated = typeEstimated;
    _description = description;
  }

  Room.fromJson(dynamic json) {
    _type = json['type'];
    _typeEstimated = json['typeEstimated'] != null
        ? TypeEstimated.fromJson(json['typeEstimated'])
        : null;
    _description = json['description'] != null
        ? Description.fromJson(json['description'])
        : null;
  }

  String? _type;
  TypeEstimated? _typeEstimated;
  Description? _description;

  Room copyWith({
    String? type,
    TypeEstimated? typeEstimated,
    Description? description,
  }) =>
      Room(
        type: type ?? _type,
        typeEstimated: typeEstimated ?? _typeEstimated,
        description: description ?? _description,
      );

  String? get type => _type;

  TypeEstimated? get typeEstimated => _typeEstimated;

  Description? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    if (_typeEstimated != null) {
      map['typeEstimated'] = _typeEstimated?.toJson();
    }
    if (_description != null) {
      map['description'] = _description?.toJson();
    }
    return map;
  }
}

/// category : "STANDARD_ROOM"

class TypeEstimated {
  TypeEstimated({
    String? category,
  }) {
    _category = category;
  }

  TypeEstimated.fromJson(dynamic json) {
    _category = json['category'];
  }

  String? _category;

  TypeEstimated copyWith({
    String? category,
  }) =>
      TypeEstimated(
        category: category ?? _category,
      );

  String? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category'] = _category;
    return map;
  }
}

/// percentage : "4.00"

class Commission {
  Commission({
    String? percentage,
  }) {
    _percentage = percentage;
  }

  Commission.fromJson(dynamic json) {
    _percentage = json['percentage'];
  }

  String? _percentage;

  Commission copyWith({
    String? percentage,
  }) =>
      Commission(
        percentage: percentage ?? _percentage,
      );

  String? get percentage => _percentage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['percentage'] = _percentage;
    return map;
  }
}

/// type : "hotel"
/// hotelId : "HSORYAAW"
/// chainCode : "HS"
/// dupeId : "700004907"
/// name : "Austin's Arts et Métiers"
/// rating : "3"
/// cityCode : "ORY"
/// latitude : 48.86591
/// longitude : 2.35704
/// hotelDistance : {"distance":1.6,"distanceUnit":"KM"}
/// address : {"lines":["6, RUE MONTGOLFIER"],"postalCode":"75003","cityName":"PARIS","countryCode":"FR"}
/// contact : {"phone":"(33) 142771761","fax":"(33) 142775543","email":"austins.amhotel@wanadoo.fr"}
/// description : {"lang":"en","text":"Well-equipped rooms are offered by the hotel Austin's Arts et Métiers in Paris. The services of the hotel and its personnel provide a relaxing and comfortable stay. The reception desk of the hotel Austin's Arts et Métiers is available 24 hours a day."}
/// amenities : ["24_HOUR_FRONT_DESK","MULTILINGUAL_STAFF","ELEVATOR","INTERNET_SERVICES","SAFE_DEPOSIT_BOX","VENDING_MACHINES","CONCIERGE","DRIVING_RANGE","NIGHT_CLUB","WIRELESS_CONNECTIVITY","COFFEE_SHOP","CONCIERGE","PORTER/BELLBOY","FIRE_DETECTORS","VIDEO_SURVEILANCE"]
/// media : [{"uri":"http://uat.multimediarepository.testing.amadeus.com/cmr/retrieve/hotel/489CB230736E40C4B3F56A26A0062E10","category":"EXTERIOR"}]

class Hotel {
  Hotel({
    String? type,
    String? hotelId,
    String? chainCode,
    String? dupeId,
    String? name,
    String? rating,
    String? cityCode,
    double? latitude,
    double? longitude,
    HotelDistance? hotelDistance,
    Address? address,
    Contact? contact,
    Description? description,
    List<String>? amenities,
    List<Media>? media,
  }) {
    _type = type;
    _hotelId = hotelId;
    _chainCode = chainCode;
    _dupeId = dupeId;
    _name = name;
    _rating = rating;
    _cityCode = cityCode;
    _latitude = latitude;
    _longitude = longitude;
    _hotelDistance = hotelDistance;
    _address = address;
    _contact = contact;
    _description = description;
    _amenities = amenities;
    _media = media;
  }

  Hotel.fromJson(dynamic json) {
    _type = json['type'];
    _hotelId = json['hotelId'];
    _chainCode = json['chainCode'];
    _dupeId = json['dupeId'];
    _name = json['name'];
    _rating = json['rating'];
    _cityCode = json['cityCode'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _hotelDistance = json['hotelDistance'] != null
        ? HotelDistance.fromJson(json['hotelDistance'])
        : null;
    _address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    _contact =
        json['contact'] != null ? Contact.fromJson(json['contact']) : null;
    _description = json['description'] != null
        ? Description.fromJson(json['description'])
        : null;
    _amenities =
        json['amenities'] != null ? json['amenities'].cast<String>() : [];
    if (json['media'] != null) {
      _media = [];
      json['media'].forEach((v) {
        _media?.add(Media.fromJson(v));
      });
    }
  }

  String? _type;
  String? _hotelId;
  String? _chainCode;
  String? _dupeId;
  String? _name;
  String? _rating;
  String? _cityCode;
  double? _latitude;
  double? _longitude;
  HotelDistance? _hotelDistance;
  Address? _address;
  Contact? _contact;
  Description? _description;
  List<String>? _amenities;
  List<Media>? _media;

  Hotel copyWith({
    String? type,
    String? hotelId,
    String? chainCode,
    String? dupeId,
    String? name,
    String? rating,
    String? cityCode,
    double? latitude,
    double? longitude,
    HotelDistance? hotelDistance,
    Address? address,
    Contact? contact,
    Description? description,
    List<String>? amenities,
    List<Media>? media,
  }) =>
      Hotel(
        type: type ?? _type,
        hotelId: hotelId ?? _hotelId,
        chainCode: chainCode ?? _chainCode,
        dupeId: dupeId ?? _dupeId,
        name: name ?? _name,
        rating: rating ?? _rating,
        cityCode: cityCode ?? _cityCode,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        hotelDistance: hotelDistance ?? _hotelDistance,
        address: address ?? _address,
        contact: contact ?? _contact,
        description: description ?? _description,
        amenities: amenities ?? _amenities,
        media: media ?? _media,
      );

  String? get type => _type;

  String? get hotelId => _hotelId;

  String? get chainCode => _chainCode;

  String? get dupeId => _dupeId;

  String? get name => _name;

  String? get rating => _rating;

  String? get cityCode => _cityCode;

  double? get latitude => _latitude;

  double? get longitude => _longitude;

  HotelDistance? get hotelDistance => _hotelDistance;

  Address? get address => _address;

  Contact? get contact => _contact;

  Description? get description => _description;

  List<String>? get amenities => _amenities;

  List<Media>? get media => _media;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['hotelId'] = _hotelId;
    map['chainCode'] = _chainCode;
    map['dupeId'] = _dupeId;
    map['name'] = _name;
    map['rating'] = _rating;
    map['cityCode'] = _cityCode;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    if (_hotelDistance != null) {
      map['hotelDistance'] = _hotelDistance?.toJson();
    }
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    if (_contact != null) {
      map['contact'] = _contact?.toJson();
    }
    if (_description != null) {
      map['description'] = _description?.toJson();
    }
    map['amenities'] = _amenities;
    if (_media != null) {
      map['media'] = _media?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// uri : "http://uat.multimediarepository.testing.amadeus.com/cmr/retrieve/hotel/489CB230736E40C4B3F56A26A0062E10"
/// category : "EXTERIOR"

class Media {
  Media({
    String? uri,
    String? category,
  }) {
    _uri = uri;
    _category = category;
  }

  Media.fromJson(dynamic json) {
    _uri = json['uri'];
    _category = json['category'];
  }

  String? _uri;
  String? _category;

  Media copyWith({
    String? uri,
    String? category,
  }) =>
      Media(
        uri: uri ?? _uri,
        category: category ?? _category,
      );

  String? get uri => _uri;

  String? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uri'] = _uri;
    map['category'] = _category;
    return map;
  }
}

/// lang : "en"
/// text : "Well-equipped rooms are offered by the hotel Austin's Arts et Métiers in Paris. The services of the hotel and its personnel provide a relaxing and comfortable stay. The reception desk of the hotel Austin's Arts et Métiers is available 24 hours a day."

class Description {
  Description({
    String? lang,
    String? text,
  }) {
    _lang = lang;
    _text = text;
  }

  Description.fromJson(dynamic json) {
    _lang = json['lang'];
    _text = json['text'];
  }

  String? _lang;
  String? _text;

  Description copyWith({
    String? lang,
    String? text,
  }) =>
      Description(
        lang: lang ?? _lang,
        text: text ?? _text,
      );

  String? get lang => _lang;

  String? get text => _text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lang'] = _lang;
    map['text'] = _text;
    return map;
  }
}

/// phone : "(33) 142771761"
/// fax : "(33) 142775543"
/// email : "austins.amhotel@wanadoo.fr"

class Contact {
  Contact({
    String? phone,
    String? fax,
    String? email,
  }) {
    _phone = phone;
    _fax = fax;
    _email = email;
  }

  Contact.fromJson(dynamic json) {
    _phone = json['phone'];
    _fax = json['fax'];
    _email = json['email'];
  }

  String? _phone;
  String? _fax;
  String? _email;

  Contact copyWith({
    String? phone,
    String? fax,
    String? email,
  }) =>
      Contact(
        phone: phone ?? _phone,
        fax: fax ?? _fax,
        email: email ?? _email,
      );

  String? get phone => _phone;

  String? get fax => _fax;

  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = _phone;
    map['fax'] = _fax;
    map['email'] = _email;
    return map;
  }
}

/// lines : ["6, RUE MONTGOLFIER"]
/// postalCode : "75003"
/// cityName : "PARIS"
/// countryCode : "FR"

class Address {
  Address({
    List<String>? lines,
    String? postalCode,
    String? cityName,
    String? countryCode,
  }) {
    _lines = lines;
    _postalCode = postalCode;
    _cityName = cityName;
    _countryCode = countryCode;
  }

  Address.fromJson(dynamic json) {
    _lines = json['lines'] != null ? json['lines'].cast<String>() : [];
    _postalCode = json['postalCode'];
    _cityName = json['cityName'];
    _countryCode = json['countryCode'];
  }

  List<String>? _lines;
  String? _postalCode;
  String? _cityName;
  String? _countryCode;

  Address copyWith({
    List<String>? lines,
    String? postalCode,
    String? cityName,
    String? countryCode,
  }) =>
      Address(
        lines: lines ?? _lines,
        postalCode: postalCode ?? _postalCode,
        cityName: cityName ?? _cityName,
        countryCode: countryCode ?? _countryCode,
      );

  List<String>? get lines => _lines;

  String? get postalCode => _postalCode;

  String? get cityName => _cityName;

  String? get countryCode => _countryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lines'] = _lines;
    map['postalCode'] = _postalCode;
    map['cityName'] = _cityName;
    map['countryCode'] = _countryCode;
    return map;
  }
}

/// distance : 1.6
/// distanceUnit : "KM"

class HotelDistance {
  HotelDistance({
    double? distance,
    String? distanceUnit,
  }) {
    _distance = distance;
    _distanceUnit = distanceUnit;
  }

  HotelDistance.fromJson(dynamic json) {
    _distance = json['distance'];
    _distanceUnit = json['distanceUnit'];
  }

  double? _distance;
  String? _distanceUnit;

  HotelDistance copyWith({
    double? distance,
    String? distanceUnit,
  }) =>
      HotelDistance(
        distance: distance ?? _distance,
        distanceUnit: distanceUnit ?? _distanceUnit,
      );

  double? get distance => _distance;

  String? get distanceUnit => _distanceUnit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['distance'] = _distance;
    map['distanceUnit'] = _distanceUnit;
    return map;
  }
}
