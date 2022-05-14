class UserModel {
  String userName;
  String email;
  String firstName;
  String lastName;

  UserModel({
    required this.userName,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  Map<String, String> toJson() => {
        'userName': userName,
        'email': email,
        'firstName': firstName,
        'lastName': lastName
      };
}
