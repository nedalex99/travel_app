import 'dart:convert';

import 'package:get/get.dart';
import 'package:travel_app/model/recommendation_model.dart';
import 'package:travel_app/utils/network/amadeus_api/recommendation_search/get_recommendation_response.dart';
import 'package:travel_app/utils/responses/default_response.dart';
import 'package:travel_app/utils/responses/error_response.dart';
import 'package:travel_app/utils/session_temp.dart';
import 'package:http/http.dart' as http;

class RecommendationSearch extends GetConnect {
  Future<DefaultResponse> getRecommendationSearch({
    required String cityCode,
  }) async {
    var headers = {
      'Authorization': 'Bearer $amadeusAccessToken',
    };
    var request = http.Request(
      'GET',
      Uri.parse(
        'https://test.api.amadeus.com/v1/reference-data/recommended-locations?cityCodes=$cityCode',
      ),
    );
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var json = jsonDecode(
      await response.stream.bytesToString(),
    );

    if (response.statusCode == 200) {
      return GetRecommendationResponse(
        statusCode: 200,
        status: "success",
        recommendationModelList:
            (json['data'] as List).map((e) => RecommendationModel.fromJson(e)).toList(),
      );
    } else {
      return ErrorResponse(status: "error", statusCode: response.statusCode);
    }
  }
}
