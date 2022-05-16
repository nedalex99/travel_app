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
}
