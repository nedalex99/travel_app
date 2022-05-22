class Passenger {
  String firstName;
  String lastName;
  String gender;
  String dateBirth;

  Passenger({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.dateBirth,
  });

  Map<String, String> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'gender': gender,
        'dateBirth': dateBirth,
      };

  factory Passenger.fromJson(dynamic json) => Passenger(
        firstName: json['firstName'],
        lastName: json['lastName'],
        gender: json['gender'],
        dateBirth: json['dateBirth'],
      );

  @override
  String toString() {
    return "$firstName $lastName";
  }
}
