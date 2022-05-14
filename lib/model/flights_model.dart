/// meta : {"count":1,"links":{"self":"https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=OTP&destinationLocationCode=CDG&departureDate=2022-11-01&returnDate=2022-11-18&adults=1&max=1"}}
/// data : [{"type":"flight-offer","id":"1","source":"GDS","instantTicketingRequired":false,"nonHomogeneous":false,"oneWay":false,"lastTicketingDate":"2022-05-12","numberOfBookableSeats":9,"itineraries":[{"duration":"PT3H20M","segments":[{"departure":{"iataCode":"OTP","at":"2022-11-01T08:40:00"},"arrival":{"iataCode":"CDG","terminal":"2E","at":"2022-11-01T11:00:00"},"carrierCode":"RO","number":"381","aircraft":{"code":"73H"},"operating":{"carrierCode":"RO"},"duration":"PT3H20M","id":"1","numberOfStops":0,"blacklistedInEU":false}]},{"duration":"PT2H50M","segments":[{"departure":{"iataCode":"CDG","terminal":"2E","at":"2022-11-18T12:00:00"},"arrival":{"iataCode":"OTP","at":"2022-11-18T15:50:00"},"carrierCode":"RO","number":"382","aircraft":{"code":"73H"},"operating":{"carrierCode":"RO"},"duration":"PT2H50M","id":"2","numberOfStops":0,"blacklistedInEU":false}]}],"price":{"currency":"EUR","total":"145.68","base":"53.00","fees":[{"amount":"0.00","type":"SUPPLIER"},{"amount":"0.00","type":"TICKETING"}],"grandTotal":"145.68","additionalServices":[{"amount":"90.00","type":"CHECKED_BAGS"}]},"pricingOptions":{"fareType":["PUBLISHED"],"includedCheckedBagsOnly":false},"validatingAirlineCodes":["RO"],"travelerPricings":[{"travelerId":"1","fareOption":"STANDARD","travelerType":"ADULT","price":{"currency":"EUR","total":"145.68","base":"53.00"},"fareDetailsBySegment":[{"segmentId":"1","cabin":"ECONOMY","fareBasis":"ERTLGTFR","class":"E","includedCheckedBags":{"quantity":0}},{"segmentId":"2","cabin":"ECONOMY","fareBasis":"ERTLGTFR","class":"E","includedCheckedBags":{"quantity":0}}]}]}]
/// dictionaries : {"locations":{"CDG":{"cityCode":"PAR","countryCode":"FR"},"OTP":{"cityCode":"BUH","countryCode":"RO"}},"aircraft":{"73H":"BOEING 737-800 (WINGLETS)"},"currencies":{"EUR":"EURO"},"carriers":{"RO":"TAROM"}}

class FlightsModel {
  FlightsModel({
    Meta? meta,
    List<Data>? data,
    Dictionaries? dictionaries,
  }) {
    _meta = meta;
    _data = data ?? [];
    _dictionaries = dictionaries;
  }

  FlightsModel.fromJson(dynamic json) {
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _dictionaries = json['dictionaries'] != null
        ? Dictionaries.fromJson(json['dictionaries'])
        : null;
  }

  Meta? _meta;
  List<Data>? _data;
  Dictionaries? _dictionaries;

  FlightsModel copyWith({
    Meta? meta,
    List<Data>? data,
    Dictionaries? dictionaries,
  }) =>
      FlightsModel(
        meta: meta ?? _meta,
        data: data ?? _data,
        dictionaries: dictionaries ?? _dictionaries,
      );

  Meta? get meta => _meta;

  List<Data>? get data => _data;

  Dictionaries? get dictionaries => _dictionaries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_dictionaries != null) {
      map['dictionaries'] = _dictionaries?.toJson();
    }
    return map;
  }
}

/// locations : {"CDG":{"cityCode":"PAR","countryCode":"FR"},"OTP":{"cityCode":"BUH","countryCode":"RO"}}
/// aircraft : {"73H":"BOEING 737-800 (WINGLETS)"}
/// currencies : {"EUR":"EURO"}
/// carriers : {"RO":"TAROM"}

class Dictionaries {
  Dictionaries({
    Locations? locations,
    Aircraft? aircraft,
    Currencies? currencies,
    Carriers? carriers,
  }) {
    _locations = locations;
    _aircraft = aircraft;
    _currencies = currencies;
    _carriers = carriers;
  }

  Dictionaries.fromJson(dynamic json) {
    _locations = json['locations'] != null
        ? Locations.fromJson(json['locations'])
        : null;
    _aircraft =
        json['aircraft'] != null ? Aircraft.fromJson(json['aircraft']) : null;
    _currencies = json['currencies'] != null
        ? Currencies.fromJson(json['currencies'])
        : null;
    _carriers =
        json['carriers'] != null ? Carriers.fromJson(json['carriers']) : null;
  }

  Locations? _locations;
  Aircraft? _aircraft;
  Currencies? _currencies;
  Carriers? _carriers;

  Dictionaries copyWith({
    Locations? locations,
    Aircraft? aircraft,
    Currencies? currencies,
    Carriers? carriers,
  }) =>
      Dictionaries(
        locations: locations ?? _locations,
        aircraft: aircraft ?? _aircraft,
        currencies: currencies ?? _currencies,
        carriers: carriers ?? _carriers,
      );

  Locations? get locations => _locations;

  Aircraft? get aircraft => _aircraft;

  Currencies? get currencies => _currencies;

  Carriers? get carriers => _carriers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_locations != null) {
      map['locations'] = _locations?.toJson();
    }
    if (_aircraft != null) {
      map['aircraft'] = _aircraft?.toJson();
    }
    if (_currencies != null) {
      map['currencies'] = _currencies?.toJson();
    }
    if (_carriers != null) {
      map['carriers'] = _carriers?.toJson();
    }
    return map;
  }
}

/// RO : "TAROM"

class Carriers {
  Carriers({
    String? ro,
  }) {
    _ro = ro;
  }

  Carriers.fromJson(dynamic json) {
    _ro = json['RO'];
  }

  String? _ro;

  Carriers copyWith({
    String? ro,
  }) =>
      Carriers(
        ro: ro ?? _ro,
      );

  String? get ro => _ro;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['RO'] = _ro;
    return map;
  }
}

/// EUR : "EURO"

class Currencies {
  Currencies({
    String? eur,
  }) {
    _eur = eur;
  }

  Currencies.fromJson(dynamic json) {
    _eur = json['EUR'];
  }

  String? _eur;

  Currencies copyWith({
    String? eur,
  }) =>
      Currencies(
        eur: eur ?? _eur,
      );

  String? get eur => _eur;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['EUR'] = _eur;
    return map;
  }
}

/// CDG : {"cityCode":"PAR","countryCode":"FR"}
/// OTP : {"cityCode":"BUH","countryCode":"RO"}

class Locations {
  Locations({
    Cdg? cdg,
    Otp? otp,
  }) {
    _cdg = cdg;
    _otp = otp;
  }

  Locations.fromJson(dynamic json) {
    _cdg = json['CDG'] != null ? Cdg.fromJson(json['CDG']) : null;
    _otp = json['OTP'] != null ? Otp.fromJson(json['OTP']) : null;
  }

  Cdg? _cdg;
  Otp? _otp;

  Locations copyWith({
    Cdg? cdg,
    Otp? otp,
  }) =>
      Locations(
        cdg: cdg ?? _cdg,
        otp: otp ?? _otp,
      );

  Cdg? get cdg => _cdg;

  Otp? get otp => _otp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_cdg != null) {
      map['CDG'] = _cdg?.toJson();
    }
    if (_otp != null) {
      map['OTP'] = _otp?.toJson();
    }
    return map;
  }
}

/// cityCode : "BUH"
/// countryCode : "RO"

class Otp {
  Otp({
    String? cityCode,
    String? countryCode,
  }) {
    _cityCode = cityCode;
    _countryCode = countryCode;
  }

  Otp.fromJson(dynamic json) {
    _cityCode = json['cityCode'];
    _countryCode = json['countryCode'];
  }

  String? _cityCode;
  String? _countryCode;

  Otp copyWith({
    String? cityCode,
    String? countryCode,
  }) =>
      Otp(
        cityCode: cityCode ?? _cityCode,
        countryCode: countryCode ?? _countryCode,
      );

  String? get cityCode => _cityCode;

  String? get countryCode => _countryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cityCode'] = _cityCode;
    map['countryCode'] = _countryCode;
    return map;
  }
}

/// cityCode : "PAR"
/// countryCode : "FR"

class Cdg {
  Cdg({
    String? cityCode,
    String? countryCode,
  }) {
    _cityCode = cityCode;
    _countryCode = countryCode;
  }

  Cdg.fromJson(dynamic json) {
    _cityCode = json['cityCode'];
    _countryCode = json['countryCode'];
  }

  String? _cityCode;
  String? _countryCode;

  Cdg copyWith({
    String? cityCode,
    String? countryCode,
  }) =>
      Cdg(
        cityCode: cityCode ?? _cityCode,
        countryCode: countryCode ?? _countryCode,
      );

  String? get cityCode => _cityCode;

  String? get countryCode => _countryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cityCode'] = _cityCode;
    map['countryCode'] = _countryCode;
    return map;
  }
}

/// type : "flight-offer"
/// id : "1"
/// source : "GDS"
/// instantTicketingRequired : false
/// nonHomogeneous : false
/// oneWay : false
/// lastTicketingDate : "2022-05-12"
/// numberOfBookableSeats : 9
/// itineraries : [{"duration":"PT3H20M","segments":[{"departure":{"iataCode":"OTP","at":"2022-11-01T08:40:00"},"arrival":{"iataCode":"CDG","terminal":"2E","at":"2022-11-01T11:00:00"},"carrierCode":"RO","number":"381","aircraft":{"code":"73H"},"operating":{"carrierCode":"RO"},"duration":"PT3H20M","id":"1","numberOfStops":0,"blacklistedInEU":false}]},{"duration":"PT2H50M","segments":[{"departure":{"iataCode":"CDG","terminal":"2E","at":"2022-11-18T12:00:00"},"arrival":{"iataCode":"OTP","at":"2022-11-18T15:50:00"},"carrierCode":"RO","number":"382","aircraft":{"code":"73H"},"operating":{"carrierCode":"RO"},"duration":"PT2H50M","id":"2","numberOfStops":0,"blacklistedInEU":false}]}]
/// price : {"currency":"EUR","total":"145.68","base":"53.00","fees":[{"amount":"0.00","type":"SUPPLIER"},{"amount":"0.00","type":"TICKETING"}],"grandTotal":"145.68","additionalServices":[{"amount":"90.00","type":"CHECKED_BAGS"}]}
/// pricingOptions : {"fareType":["PUBLISHED"],"includedCheckedBagsOnly":false}
/// validatingAirlineCodes : ["RO"]
/// travelerPricings : [{"travelerId":"1","fareOption":"STANDARD","travelerType":"ADULT","price":{"currency":"EUR","total":"145.68","base":"53.00"},"fareDetailsBySegment":[{"segmentId":"1","cabin":"ECONOMY","fareBasis":"ERTLGTFR","class":"E","includedCheckedBags":{"quantity":0}},{"segmentId":"2","cabin":"ECONOMY","fareBasis":"ERTLGTFR","class":"E","includedCheckedBags":{"quantity":0}}]}]

class Data {
  Data({
    String? type,
    String? id,
    String? source,
    bool? instantTicketingRequired,
    bool? nonHomogeneous,
    bool? oneWay,
    String? lastTicketingDate,
    int? numberOfBookableSeats,
    List<Itineraries>? itineraries,
    Price? price,
    PricingOptions? pricingOptions,
    List<String>? validatingAirlineCodes,
    List<TravelerPricings>? travelerPricings,
  }) {
    _type = type;
    _id = id;
    _source = source;
    _instantTicketingRequired = instantTicketingRequired;
    _nonHomogeneous = nonHomogeneous;
    _oneWay = oneWay;
    _lastTicketingDate = lastTicketingDate;
    _numberOfBookableSeats = numberOfBookableSeats;
    _itineraries = itineraries;
    _price = price;
    _pricingOptions = pricingOptions;
    _validatingAirlineCodes = validatingAirlineCodes;
    _travelerPricings = travelerPricings;
  }

  Data.fromJson(dynamic json) {
    _type = json['type'];
    _id = json['id'];
    _source = json['source'];
    _instantTicketingRequired = json['instantTicketingRequired'];
    _nonHomogeneous = json['nonHomogeneous'];
    _oneWay = json['oneWay'];
    _lastTicketingDate = json['lastTicketingDate'];
    _numberOfBookableSeats = json['numberOfBookableSeats'];
    if (json['itineraries'] != null) {
      _itineraries = [];
      json['itineraries'].forEach((v) {
        _itineraries?.add(Itineraries.fromJson(v));
      });
    }
    _price = json['price'] != null ? Price.fromJson(json['price']) : null;
    _pricingOptions = json['pricingOptions'] != null
        ? PricingOptions.fromJson(json['pricingOptions'])
        : null;
    _validatingAirlineCodes = json['validatingAirlineCodes'] != null
        ? json['validatingAirlineCodes'].cast<String>()
        : [];
    if (json['travelerPricings'] != null) {
      _travelerPricings = [];
      json['travelerPricings'].forEach((v) {
        _travelerPricings?.add(TravelerPricings.fromJson(v));
      });
    }
  }

  String? _type;
  String? _id;
  String? _source;
  bool? _instantTicketingRequired;
  bool? _nonHomogeneous;
  bool? _oneWay;
  String? _lastTicketingDate;
  int? _numberOfBookableSeats;
  List<Itineraries>? _itineraries;
  Price? _price;
  PricingOptions? _pricingOptions;
  List<String>? _validatingAirlineCodes;
  List<TravelerPricings>? _travelerPricings;

  Data copyWith({
    String? type,
    String? id,
    String? source,
    bool? instantTicketingRequired,
    bool? nonHomogeneous,
    bool? oneWay,
    String? lastTicketingDate,
    int? numberOfBookableSeats,
    List<Itineraries>? itineraries,
    Price? price,
    PricingOptions? pricingOptions,
    List<String>? validatingAirlineCodes,
    List<TravelerPricings>? travelerPricings,
  }) =>
      Data(
        type: type ?? _type,
        id: id ?? _id,
        source: source ?? _source,
        instantTicketingRequired:
            instantTicketingRequired ?? _instantTicketingRequired,
        nonHomogeneous: nonHomogeneous ?? _nonHomogeneous,
        oneWay: oneWay ?? _oneWay,
        lastTicketingDate: lastTicketingDate ?? _lastTicketingDate,
        numberOfBookableSeats: numberOfBookableSeats ?? _numberOfBookableSeats,
        itineraries: itineraries ?? _itineraries,
        price: price ?? _price,
        pricingOptions: pricingOptions ?? _pricingOptions,
        validatingAirlineCodes:
            validatingAirlineCodes ?? _validatingAirlineCodes,
        travelerPricings: travelerPricings ?? _travelerPricings,
      );

  String? get type => _type;

  String? get id => _id;

  String? get source => _source;

  bool? get instantTicketingRequired => _instantTicketingRequired;

  bool? get nonHomogeneous => _nonHomogeneous;

  bool? get oneWay => _oneWay;

  String? get lastTicketingDate => _lastTicketingDate;

  int? get numberOfBookableSeats => _numberOfBookableSeats;

  List<Itineraries>? get itineraries => _itineraries;

  Price? get price => _price;

  PricingOptions? get pricingOptions => _pricingOptions;

  List<String>? get validatingAirlineCodes => _validatingAirlineCodes;

  List<TravelerPricings>? get travelerPricings => _travelerPricings;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['id'] = _id;
    map['source'] = _source;
    map['instantTicketingRequired'] = _instantTicketingRequired;
    map['nonHomogeneous'] = _nonHomogeneous;
    map['oneWay'] = _oneWay;
    map['lastTicketingDate'] = _lastTicketingDate;
    map['numberOfBookableSeats'] = _numberOfBookableSeats;
    if (_itineraries != null) {
      map['itineraries'] = _itineraries?.map((v) => v.toJson()).toList();
    }
    if (_price != null) {
      map['price'] = _price?.toJson();
    }
    if (_pricingOptions != null) {
      map['pricingOptions'] = _pricingOptions?.toJson();
    }
    map['validatingAirlineCodes'] = _validatingAirlineCodes;
    if (_travelerPricings != null) {
      map['travelerPricings'] =
          _travelerPricings?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// travelerId : "1"
/// fareOption : "STANDARD"
/// travelerType : "ADULT"
/// price : {"currency":"EUR","total":"145.68","base":"53.00"}
/// fareDetailsBySegment : [{"segmentId":"1","cabin":"ECONOMY","fareBasis":"ERTLGTFR","class":"E","includedCheckedBags":{"quantity":0}},{"segmentId":"2","cabin":"ECONOMY","fareBasis":"ERTLGTFR","class":"E","includedCheckedBags":{"quantity":0}}]

class TravelerPricings {
  TravelerPricings({
    String? travelerId,
    String? fareOption,
    String? travelerType,
    Price? price,
    List<FareDetailsBySegment>? fareDetailsBySegment,
  }) {
    _travelerId = travelerId;
    _fareOption = fareOption;
    _travelerType = travelerType;
    _price = price;
    _fareDetailsBySegment = fareDetailsBySegment;
  }

  TravelerPricings.fromJson(dynamic json) {
    _travelerId = json['travelerId'];
    _fareOption = json['fareOption'];
    _travelerType = json['travelerType'];
    _price = json['price'] != null ? Price.fromJson(json['price']) : null;
    if (json['fareDetailsBySegment'] != null) {
      _fareDetailsBySegment = [];
      json['fareDetailsBySegment'].forEach((v) {
        _fareDetailsBySegment?.add(FareDetailsBySegment.fromJson(v));
      });
    }
  }

  String? _travelerId;
  String? _fareOption;
  String? _travelerType;
  Price? _price;
  List<FareDetailsBySegment>? _fareDetailsBySegment;

  TravelerPricings copyWith({
    String? travelerId,
    String? fareOption,
    String? travelerType,
    Price? price,
    List<FareDetailsBySegment>? fareDetailsBySegment,
  }) =>
      TravelerPricings(
        travelerId: travelerId ?? _travelerId,
        fareOption: fareOption ?? _fareOption,
        travelerType: travelerType ?? _travelerType,
        price: price ?? _price,
        fareDetailsBySegment: fareDetailsBySegment ?? _fareDetailsBySegment,
      );

  String? get travelerId => _travelerId;

  String? get fareOption => _fareOption;

  String? get travelerType => _travelerType;

  Price? get price => _price;

  List<FareDetailsBySegment>? get fareDetailsBySegment => _fareDetailsBySegment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['travelerId'] = _travelerId;
    map['fareOption'] = _fareOption;
    map['travelerType'] = _travelerType;
    if (_price != null) {
      map['price'] = _price?.toJson();
    }
    if (_fareDetailsBySegment != null) {
      map['fareDetailsBySegment'] =
          _fareDetailsBySegment?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// segmentId : "1"
/// cabin : "ECONOMY"
/// fareBasis : "ERTLGTFR"
/// class : "E"
/// includedCheckedBags : {"quantity":0}

class FareDetailsBySegment {
  FareDetailsBySegment({
    String? segmentId,
    String? cabin,
    String? fareBasis,
    IncludedCheckedBags? includedCheckedBags,
  }) {
    _segmentId = segmentId;
    _cabin = cabin;
    _fareBasis = fareBasis;
    _includedCheckedBags = includedCheckedBags;
  }

  FareDetailsBySegment.fromJson(dynamic json) {
    _segmentId = json['segmentId'];
    _cabin = json['cabin'];
    _fareBasis = json['fareBasis'];
    _includedCheckedBags = json['includedCheckedBags'] != null
        ? IncludedCheckedBags.fromJson(json['includedCheckedBags'])
        : null;
  }

  String? _segmentId;
  String? _cabin;
  String? _fareBasis;
  IncludedCheckedBags? _includedCheckedBags;

  FareDetailsBySegment copyWith({
    String? segmentId,
    String? cabin,
    String? fareBasis,
    IncludedCheckedBags? includedCheckedBags,
  }) =>
      FareDetailsBySegment(
        segmentId: segmentId ?? _segmentId,
        cabin: cabin ?? _cabin,
        fareBasis: fareBasis ?? _fareBasis,
        includedCheckedBags: includedCheckedBags ?? _includedCheckedBags,
      );

  String? get segmentId => _segmentId;

  String? get cabin => _cabin;

  String? get fareBasis => _fareBasis;

  IncludedCheckedBags? get includedCheckedBags => _includedCheckedBags;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['segmentId'] = _segmentId;
    map['cabin'] = _cabin;
    map['fareBasis'] = _fareBasis;
    if (_includedCheckedBags != null) {
      map['includedCheckedBags'] = _includedCheckedBags?.toJson();
    }
    return map;
  }
}

/// quantity : 0

class IncludedCheckedBags {
  IncludedCheckedBags({
    int? quantity,
  }) {
    _quantity = quantity;
  }

  IncludedCheckedBags.fromJson(dynamic json) {
    _quantity = json['quantity'];
  }

  int? _quantity;

  IncludedCheckedBags copyWith({
    int? quantity,
  }) =>
      IncludedCheckedBags(
        quantity: quantity ?? _quantity,
      );

  int? get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quantity'] = _quantity;
    return map;
  }
}

/// fareType : ["PUBLISHED"]
/// includedCheckedBagsOnly : false

class PricingOptions {
  PricingOptions({
    List<String>? fareType,
    bool? includedCheckedBagsOnly,
  }) {
    _fareType = fareType;
    _includedCheckedBagsOnly = includedCheckedBagsOnly;
  }

  PricingOptions.fromJson(dynamic json) {
    _fareType = json['fareType'] != null ? json['fareType'].cast<String>() : [];
    _includedCheckedBagsOnly = json['includedCheckedBagsOnly'];
  }

  List<String>? _fareType;
  bool? _includedCheckedBagsOnly;

  PricingOptions copyWith({
    List<String>? fareType,
    bool? includedCheckedBagsOnly,
  }) =>
      PricingOptions(
        fareType: fareType ?? _fareType,
        includedCheckedBagsOnly:
            includedCheckedBagsOnly ?? _includedCheckedBagsOnly,
      );

  List<String>? get fareType => _fareType;

  bool? get includedCheckedBagsOnly => _includedCheckedBagsOnly;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fareType'] = _fareType;
    map['includedCheckedBagsOnly'] = _includedCheckedBagsOnly;
    return map;
  }
}

/// currency : "EUR"
/// total : "145.68"
/// base : "53.00"
/// fees : [{"amount":"0.00","type":"SUPPLIER"},{"amount":"0.00","type":"TICKETING"}]
/// grandTotal : "145.68"
/// additionalServices : [{"amount":"90.00","type":"CHECKED_BAGS"}]

class Price {
  Price({
    String? currency,
    String? total,
    String? base,
    List<Fees>? fees,
    String? grandTotal,
    List<AdditionalServices>? additionalServices,
  }) {
    _currency = currency;
    _total = total;
    _base = base;
    _fees = fees;
    _grandTotal = grandTotal;
    _additionalServices = additionalServices;
  }

  Price.fromJson(dynamic json) {
    _currency = json['currency'];
    _total = json['total'];
    _base = json['base'];
    if (json['fees'] != null) {
      _fees = [];
      json['fees'].forEach((v) {
        _fees?.add(Fees.fromJson(v));
      });
    }
    _grandTotal = json['grandTotal'];
    if (json['additionalServices'] != null) {
      _additionalServices = [];
      json['additionalServices'].forEach((v) {
        _additionalServices?.add(AdditionalServices.fromJson(v));
      });
    }
  }

  String? _currency;
  String? _total;
  String? _base;
  List<Fees>? _fees;
  String? _grandTotal;
  List<AdditionalServices>? _additionalServices;

  Price copyWith({
    String? currency,
    String? total,
    String? base,
    List<Fees>? fees,
    String? grandTotal,
    List<AdditionalServices>? additionalServices,
  }) =>
      Price(
        currency: currency ?? _currency,
        total: total ?? _total,
        base: base ?? _base,
        fees: fees ?? _fees,
        grandTotal: grandTotal ?? _grandTotal,
        additionalServices: additionalServices ?? _additionalServices,
      );

  String? get currency => _currency;

  String? get total => _total;

  String? get base => _base;

  List<Fees>? get fees => _fees;

  String? get grandTotal => _grandTotal;

  List<AdditionalServices>? get additionalServices => _additionalServices;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currency'] = _currency;
    map['total'] = _total;
    map['base'] = _base;
    if (_fees != null) {
      map['fees'] = _fees?.map((v) => v.toJson()).toList();
    }
    map['grandTotal'] = _grandTotal;
    if (_additionalServices != null) {
      map['additionalServices'] =
          _additionalServices?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// amount : "90.00"
/// type : "CHECKED_BAGS"

class AdditionalServices {
  AdditionalServices({
    String? amount,
    String? type,
  }) {
    _amount = amount;
    _type = type;
  }

  AdditionalServices.fromJson(dynamic json) {
    _amount = json['amount'];
    _type = json['type'];
  }

  String? _amount;
  String? _type;

  AdditionalServices copyWith({
    String? amount,
    String? type,
  }) =>
      AdditionalServices(
        amount: amount ?? _amount,
        type: type ?? _type,
      );

  String? get amount => _amount;

  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = _amount;
    map['type'] = _type;
    return map;
  }
}

/// amount : "0.00"
/// type : "SUPPLIER"

class Fees {
  Fees({
    String? amount,
    String? type,
  }) {
    _amount = amount;
    _type = type;
  }

  Fees.fromJson(dynamic json) {
    _amount = json['amount'];
    _type = json['type'];
  }

  String? _amount;
  String? _type;

  Fees copyWith({
    String? amount,
    String? type,
  }) =>
      Fees(
        amount: amount ?? _amount,
        type: type ?? _type,
      );

  String? get amount => _amount;

  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = _amount;
    map['type'] = _type;
    return map;
  }
}

/// duration : "PT3H20M"
/// segments : [{"departure":{"iataCode":"OTP","at":"2022-11-01T08:40:00"},"arrival":{"iataCode":"CDG","terminal":"2E","at":"2022-11-01T11:00:00"},"carrierCode":"RO","number":"381","aircraft":{"code":"73H"},"operating":{"carrierCode":"RO"},"duration":"PT3H20M","id":"1","numberOfStops":0,"blacklistedInEU":false}]

class Itineraries {
  Itineraries({
    String? duration,
    List<Segments>? segments,
  }) {
    _duration = duration;
    _segments = segments;
  }

  Itineraries.fromJson(dynamic json) {
    _duration = json['duration'];
    if (json['segments'] != null) {
      _segments = [];
      json['segments'].forEach((v) {
        _segments?.add(Segments.fromJson(v));
      });
    }
  }

  String? _duration;
  List<Segments>? _segments;

  Itineraries copyWith({
    String? duration,
    List<Segments>? segments,
  }) =>
      Itineraries(
        duration: duration ?? _duration,
        segments: segments ?? _segments,
      );

  String? get duration => _duration;

  List<Segments>? get segments => _segments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['duration'] = _duration;
    if (_segments != null) {
      map['segments'] = _segments?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// departure : {"iataCode":"OTP","at":"2022-11-01T08:40:00"}
/// arrival : {"iataCode":"CDG","terminal":"2E","at":"2022-11-01T11:00:00"}
/// carrierCode : "RO"
/// number : "381"
/// aircraft : {"code":"73H"}
/// operating : {"carrierCode":"RO"}
/// duration : "PT3H20M"
/// id : "1"
/// numberOfStops : 0
/// blacklistedInEU : false

class Segments {
  Segments({
    Departure? departure,
    Arrival? arrival,
    String? carrierCode,
    String? number,
    Aircraft? aircraft,
    Operating? operating,
    String? duration,
    String? id,
    int? numberOfStops,
    bool? blacklistedInEU,
  }) {
    _departure = departure;
    _arrival = arrival;
    _carrierCode = carrierCode;
    _number = number;
    _aircraft = aircraft;
    _operating = operating;
    _duration = duration;
    _id = id;
    _numberOfStops = numberOfStops;
    _blacklistedInEU = blacklistedInEU;
  }

  Segments.fromJson(dynamic json) {
    _departure = json['departure'] != null
        ? Departure.fromJson(json['departure'])
        : null;
    _arrival =
        json['arrival'] != null ? Arrival.fromJson(json['arrival']) : null;
    _carrierCode = json['carrierCode'];
    _number = json['number'];
    _aircraft =
        json['aircraft'] != null ? Aircraft.fromJson(json['aircraft']) : null;
    _operating = json['operating'] != null
        ? Operating.fromJson(json['operating'])
        : null;
    _duration = json['duration'];
    _id = json['id'];
    _numberOfStops = json['numberOfStops'];
    _blacklistedInEU = json['blacklistedInEU'];
  }

  Departure? _departure;
  Arrival? _arrival;
  String? _carrierCode;
  String? _number;
  Aircraft? _aircraft;
  Operating? _operating;
  String? _duration;
  String? _id;
  int? _numberOfStops;
  bool? _blacklistedInEU;

  Segments copyWith({
    Departure? departure,
    Arrival? arrival,
    String? carrierCode,
    String? number,
    Aircraft? aircraft,
    Operating? operating,
    String? duration,
    String? id,
    int? numberOfStops,
    bool? blacklistedInEU,
  }) =>
      Segments(
        departure: departure ?? _departure,
        arrival: arrival ?? _arrival,
        carrierCode: carrierCode ?? _carrierCode,
        number: number ?? _number,
        aircraft: aircraft ?? _aircraft,
        operating: operating ?? _operating,
        duration: duration ?? _duration,
        id: id ?? _id,
        numberOfStops: numberOfStops ?? _numberOfStops,
        blacklistedInEU: blacklistedInEU ?? _blacklistedInEU,
      );

  Departure? get departure => _departure;

  Arrival? get arrival => _arrival;

  String? get carrierCode => _carrierCode;

  String? get number => _number;

  Aircraft? get aircraft => _aircraft;

  Operating? get operating => _operating;

  String? get duration => _duration;

  String? get id => _id;

  int? get numberOfStops => _numberOfStops;

  bool? get blacklistedInEU => _blacklistedInEU;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_departure != null) {
      map['departure'] = _departure?.toJson();
    }
    if (_arrival != null) {
      map['arrival'] = _arrival?.toJson();
    }
    map['carrierCode'] = _carrierCode;
    map['number'] = _number;
    if (_aircraft != null) {
      map['aircraft'] = _aircraft?.toJson();
    }
    if (_operating != null) {
      map['operating'] = _operating?.toJson();
    }
    map['duration'] = _duration;
    map['id'] = _id;
    map['numberOfStops'] = _numberOfStops;
    map['blacklistedInEU'] = _blacklistedInEU;
    return map;
  }
}

/// carrierCode : "RO"

class Operating {
  Operating({
    String? carrierCode,
  }) {
    _carrierCode = carrierCode;
  }

  Operating.fromJson(dynamic json) {
    _carrierCode = json['carrierCode'];
  }

  String? _carrierCode;

  Operating copyWith({
    String? carrierCode,
  }) =>
      Operating(
        carrierCode: carrierCode ?? _carrierCode,
      );

  String? get carrierCode => _carrierCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['carrierCode'] = _carrierCode;
    return map;
  }
}

/// code : "73H"

class Aircraft {
  Aircraft({
    String? code,
  }) {
    _code = code;
  }

  Aircraft.fromJson(dynamic json) {
    _code = json['code'];
  }

  String? _code;

  Aircraft copyWith({
    String? code,
  }) =>
      Aircraft(
        code: code ?? _code,
      );

  String? get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    return map;
  }
}

/// iataCode : "CDG"
/// terminal : "2E"
/// at : "2022-11-01T11:00:00"

class Arrival {
  Arrival({
    String? iataCode,
    String? terminal,
    String? at,
  }) {
    _iataCode = iataCode;
    _terminal = terminal;
    _at = at;
  }

  Arrival.fromJson(dynamic json) {
    _iataCode = json['iataCode'];
    _terminal = json['terminal'];
    _at = json['at'];
  }

  String? _iataCode;
  String? _terminal;
  String? _at;

  Arrival copyWith({
    String? iataCode,
    String? terminal,
    String? at,
  }) =>
      Arrival(
        iataCode: iataCode ?? _iataCode,
        terminal: terminal ?? _terminal,
        at: at ?? _at,
      );

  String? get iataCode => _iataCode;

  String? get terminal => _terminal;

  String? get at => _at;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iataCode'] = _iataCode;
    map['terminal'] = _terminal;
    map['at'] = _at;
    return map;
  }
}

/// iataCode : "OTP"
/// at : "2022-11-01T08:40:00"

class Departure {
  Departure({
    String? iataCode,
    String? at,
  }) {
    _iataCode = iataCode;
    _at = at;
  }

  Departure.fromJson(dynamic json) {
    _iataCode = json['iataCode'];
    _at = json['at'];
  }

  String? _iataCode;
  String? _at;

  Departure copyWith({
    String? iataCode,
    String? at,
  }) =>
      Departure(
        iataCode: iataCode ?? _iataCode,
        at: at ?? _at,
      );

  String? get iataCode => _iataCode;

  String? get at => _at;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iataCode'] = _iataCode;
    map['at'] = _at;
    return map;
  }
}

/// count : 1
/// links : {"self":"https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=OTP&destinationLocationCode=CDG&departureDate=2022-11-01&returnDate=2022-11-18&adults=1&max=1"}

class Meta {
  Meta({
    int? count,
    Links? links,
  }) {
    _count = count;
    _links = links;
  }

  Meta.fromJson(dynamic json) {
    _count = json['count'];
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }

  int? _count;
  Links? _links;

  Meta copyWith({
    int? count,
    Links? links,
  }) =>
      Meta(
        count: count ?? _count,
        links: links ?? _links,
      );

  int? get count => _count;

  Links? get links => _links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    if (_links != null) {
      map['links'] = _links?.toJson();
    }
    return map;
  }
}

/// self : "https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=OTP&destinationLocationCode=CDG&departureDate=2022-11-01&returnDate=2022-11-18&adults=1&max=1"

class Links {
  Links({
    String? self,
  }) {
    _self = self;
  }

  Links.fromJson(dynamic json) {
    _self = json['self'];
  }

  String? _self;

  Links copyWith({
    String? self,
  }) =>
      Links(
        self: self ?? _self,
      );

  String? get self => _self;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['self'] = _self;
    return map;
  }
}
