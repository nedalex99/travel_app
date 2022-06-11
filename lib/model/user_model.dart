import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/utils/util_functions.dart';

class UserModel {
  String userName;
  String email;
  String firstName;
  String lastName;
  String? uid;

  UserModel({
    required this.userName,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.uid,
  });

  Map<String, dynamic> toJson() => {
        'userName': getWordsToSearch(
          text: userName,
        ),
        'email': email,
        'firstName': firstName,
        'lastName': lastName
      };

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
      userName: json['userName'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      uid: json['uid'],
    );
  }
}
