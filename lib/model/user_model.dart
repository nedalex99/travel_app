import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/utils/util_functions.dart';

class UserModel {
  String userName;
  String email;
  String firstName;
  String lastName;
  String dateOfBirth;
  String? uid;

  UserModel({
    required this.userName,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    this.uid,
  });

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'userNameSearch': getWordsToSearch(
          text: userName,
        ),
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'dateOfBirth': dateOfBirth,
      };

  Map<String, dynamic> toJsonWithUid() => {
        'userName': userName,
        'userNameSearch': getWordsToSearch(
          text: userName,
        ),
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'dateOfBirth': dateOfBirth,
        'uid': uid,
      };

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
      userName: json['userName'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      uid: json['uid'],
      dateOfBirth: json['dateOfBirth'],
    );
  }
}
