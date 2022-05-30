import 'package:travel_app/model/points_of_interest_model.dart';
import 'package:travel_app/utils/responses/default_response.dart';

class GetPointsOfInterestResponse extends DefaultResponse {
  GetPointsOfInterestResponse({
    required int? statusCode,
    required String? status,
    required this.pointsOfInterest,
  }) : super(
          statusCode: statusCode,
          status: status,
        );

  final List<PointsOfInterestModel> pointsOfInterest;
}
