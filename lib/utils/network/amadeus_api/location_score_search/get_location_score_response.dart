import 'package:travel_app/model/location_score_model.dart';
import 'package:travel_app/utils/responses/default_response.dart';

class GetLocationScoreResponse extends DefaultResponse {
  GetLocationScoreResponse({
    required int statusCode,
    required String status,
    required this.locationScoreModel,
  }) : super(statusCode: statusCode, status: status);
  List<LocationScoreModel> locationScoreModel;
}
