import 'package:travel_app/utils/responses/default_response.dart';

class ErrorResponse implements DefaultResponse {
  @override
  String? status;

  @override
  int? statusCode;

  ErrorResponse({
    required this.status,
    required this.statusCode,
  });
}
