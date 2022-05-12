import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_app/utils/responses/default_response.dart';

class SignInResponse extends DefaultResponse {
  SignInResponse({
    required int? statusCode,
    required String? status,
    required this.user,
  }) : super(
          statusCode: statusCode,
          status: status,
        );

  final User user;
}
