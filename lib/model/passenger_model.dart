class Passenger {
  String firstName;
  String lastName;
  String dateBirth;

  Passenger({
    required this.firstName,
    required this.lastName,
    required this.dateBirth,
  });

  Map<String, String> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'dateBirth': dateBirth,
      };

  factory Passenger.fromJson(dynamic json) => Passenger(
        firstName: json['firstName'],
        lastName: json['lastName'],
        dateBirth: json['dateBirth'],
      );

  @override
  String toString() {
    return "$firstName $lastName";
  }
}
