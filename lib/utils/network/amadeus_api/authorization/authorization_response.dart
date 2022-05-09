import 'package:travel_app/model/authorization_response_model.dart';
import 'package:travel_app/utils/responses/default_response.dart';

class AuthorizationResponse implements DefaultResponse {
  @override
  String? status;

  @override
  int? statusCode;

  final AuthorizationResponseModel authorizationResponseModel;

  AuthorizationResponse({
    required this.status,
    required this.statusCode,
    required this.authorizationResponseModel,
  });
}
