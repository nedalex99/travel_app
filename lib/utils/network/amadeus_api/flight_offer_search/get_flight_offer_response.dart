import 'package:travel_app/utils/responses/default_response.dart';

class GetFlightOfferResponse extends DefaultResponse {
  GetFlightOfferResponse({required int? statusCode, required String? status})
      : super(statusCode: statusCode, status: status);
}
