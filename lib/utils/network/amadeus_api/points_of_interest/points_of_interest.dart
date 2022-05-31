import 'dart:convert';

import 'package:get/get.dart';
import 'package:travel_app/model/points_of_interest_model.dart';
import 'package:travel_app/utils/network/amadeus_api/points_of_interest/get_points_of_interest_response.dart';
import 'package:travel_app/utils/responses/default_response.dart';
import 'package:travel_app/utils/responses/error_response.dart';
import 'package:travel_app/utils/session_temp.dart';
import 'package:http/http.dart' as http;

class PointsOfInterest extends GetConnect {
  Future<DefaultResponse> getPointsOfInterest({
    required String latitude,
    required String longitude,
  }) async {
    var headers = {'Authorization': 'Bearer $amadeusAccessToken'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://test.api.amadeus.com/v1/location/analytics/category-rated-areas?latitude=41.397158&longitude=2.160873'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var json = jsonDecode(
      await response.stream.bytesToString(),
    );

    if (response.statusCode == 200) {
      return GetPointsOfInterestResponse(
        statusCode: 200,
        status: 'success',
        pointsOfInterest: (json['data'] as List)
            .map((e) => PointsOfInterestModel.fromJson(e))
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
