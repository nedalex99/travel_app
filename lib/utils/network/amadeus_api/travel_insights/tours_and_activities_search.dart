import 'dart:convert';

import 'package:get/get.dart';
import 'package:travel_app/model/tours_and_activities_model.dart';
import 'package:travel_app/utils/network/amadeus_api/travel_insights/get_tours_activities_response.dart';
import 'package:travel_app/utils/responses/default_response.dart';
import 'package:travel_app/utils/responses/error_response.dart';
import 'package:travel_app/utils/session_temp.dart';
import 'package:http/http.dart' as http;

class ToursAndActivitiesSearch extends GetConnect {
  Future<DefaultResponse> getToursAndActivitiesByLocation({
    required double latitude,
    required double longitude,
    required int radius,
  }) async {
    print(latitude);
    print(longitude);
    var headers = {'Authorization': 'Bearer $amadeusAccessToken'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://test.api.amadeus.com/v1/shopping/activities?latitude=48.8647&longitude=2.349&radius=1'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var json = jsonDecode(
      await response.stream.bytesToString(),
    );

    if (response.statusCode == 200) {
      return GetToursActivitiesResponse(
        statusCode: 200,
        status: "success",
        toursAndActivities: (json['data'] as List)
            .map((e) => ToursAndActivitiesModel.fromJson(e))
            .toList(),
      );
    } else {
      return ErrorResponse(
        status: 'error',
        statusCode: response.statusCode,
      );
    }
  }
}
