import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app/model/hotel_model.dart';
import 'package:travel_app/utils/network/amadeus_api/authorization/authorization.dart';
import 'package:travel_app/utils/network/amadeus_api/authorization/authorization_response.dart';
import 'package:travel_app/utils/network/amadeus_api/hotel_search/get_hotels_response.dart';
import 'package:travel_app/utils/responses/default_response.dart';
import 'package:travel_app/utils/responses/error_response.dart';
import 'package:travel_app/utils/session_temp.dart';

class HotelSearch extends GetConnect {
  Future<DefaultResponse> getHotels({
    required String cityCode,
  }) async {
    // print(amadeusAccessToken);
    // await Authorization().authorize().then((value) {
    //   if (value.statusCode == 200) {
    //     amadeusAccessToken = (value as AuthorizationResponse)
    //         .authorizationResponseModel
    //         .accessToken;
    //   }
    // });
    //
    // print(amadeusAccessToken);

    var headers = {
      'Authorization': 'Bearer $amadeusAccessToken',
    };
    var request = http.Request(
      'GET',
      Uri.parse(
        'https://test.api.amadeus.com/v2/shopping/hotel-offers?cityCode=$cityCode',
      ),
    );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var json = jsonDecode(
      await response.stream.bytesToString(),
    );

    print(json);

    if (response.statusCode == 200) {
      return GetHotelsResponse(
        statusCode: 200,
        status: "success",
        hotelsList: (json['data'] as List)
            .map(
              (e) => HotelModel.fromJson(e),
            )
            .toList(),
      );
    } else {
      return ErrorResponse(
        status: "error",
        statusCode: response.statusCode,
      );
    }
  }
}
