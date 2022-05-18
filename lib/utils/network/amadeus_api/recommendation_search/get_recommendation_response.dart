import 'package:travel_app/model/recommendation_model.dart';
import 'package:travel_app/utils/responses/default_response.dart';

class GetRecommendationResponse extends DefaultResponse {
  GetRecommendationResponse({
    required int statusCode,
    required String status,
    required this.recommendationModel,
  }) : super(statusCode: statusCode, status: status);
  RecommendationModel recommendationModel;
}
