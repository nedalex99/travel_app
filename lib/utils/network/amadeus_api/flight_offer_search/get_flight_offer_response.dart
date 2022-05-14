import 'package:travel_app/model/flights_model.dart';
import 'package:travel_app/utils/responses/default_response.dart';

class GetFlightOfferResponse extends DefaultResponse {
  GetFlightOfferResponse({
    required int statusCode,
    required String status,
    required this.flightModel,
  }) : super(statusCode: statusCode, status: status);
  FlightsModel flightModel;
}
