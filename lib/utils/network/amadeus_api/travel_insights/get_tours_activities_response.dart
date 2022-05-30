import 'package:travel_app/model/tours_and_activities_model.dart';
import 'package:travel_app/utils/responses/default_response.dart';

class GetToursActivitiesResponse extends DefaultResponse {
  GetToursActivitiesResponse({
    required int? statusCode,
    required String? status,
    required this.toursAndActivities,
  }) : super(
          statusCode: statusCode,
          status: status,
        );

  final List<ToursAndActivitiesModel> toursAndActivities;
}
