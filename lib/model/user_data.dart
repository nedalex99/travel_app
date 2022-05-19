import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String? email;
  String? firstName;
  String? lastName;
  String? userName;


  UserData({
     this.email,
     this.firstName,
     this.lastName,
     this.userName,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'firstName': firstName,
    'lastName': lastName,
    'userName': userName,
  };

  factory UserData.fromJson(DocumentSnapshot parsedJson) {
    if (parsedJson.data() == null || (parsedJson.data() as Map).isEmpty) {
      return UserData();
    }

    return UserData(
      email: (parsedJson.data() as Map)['email'],
      firstName: (parsedJson.data() as Map)['firstName'],
      lastName: (parsedJson.data() as Map)['lastName'],
      userName: (parsedJson.data() as Map)['userName'],

    );
  }
}
