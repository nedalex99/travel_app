import 'dart:convert';

import 'package:get/get.dart';
import 'package:travel_app/model/location_score_model.dart';
import 'package:travel_app/utils/network/amadeus_api/location_score_search/get_location_score_response.dart';
import 'package:travel_app/utils/responses/default_response.dart';
import 'package:travel_app/utils/responses/error_response.dart';
import 'package:travel_app/utils/session_temp.dart';
import 'package:http/http.dart' as http;

class LocationScoreSearch extends GetConnect {
  Future<DefaultResponse> getLocationScore({
    required double latitude,
    required double longitude,
  }) async {
    try {
      var headers = {
        'Authorization': 'Bearer $amadeusAccessToken',
      };
      var request = http.Request(
        'GET',
        Uri.parse(
          'https://test.api.amadeus.com/v1/location/analytics/category-rated-areas?latitude=$latitude&longitude=$longitude',
        ),
      );
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send().timeout(
            Duration(
              seconds: 10,
            ),
          );
      var json = jsonDecode(
        await response.stream.bytesToString(),
      );

      if (response.statusCode == 200) {
        return GetLocationScoreResponse(
          statusCode: 200,
          status: "success",
          locationScoreModel: (json['data'] as List)
              .map(
                (e) => LocationScoreModel.fromJson(e),
              )
              .toList(),
        );
      } else {
        return ErrorResponse(status: "error", statusCode: response.statusCode);
      }
    } catch (e) {
      return ErrorResponse(
        status: "error",
        statusCode: 500,
      );
    }
  }
}
