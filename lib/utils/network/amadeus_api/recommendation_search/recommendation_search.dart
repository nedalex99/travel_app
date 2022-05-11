import 'package:get/get.dart';
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

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return DefaultResponse(statusCode: 200, status: "success");
    } else {
      return ErrorResponse(status: "error", statusCode: response.statusCode);
    }
  }
}
