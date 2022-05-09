import 'dart:collection';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:travel_app/model/authorization_response_model.dart';
import 'package:travel_app/utils/network/amadeus_api/authorization/authorization_response.dart';
import 'package:travel_app/utils/responses/default_response.dart';
import 'package:travel_app/utils/responses/error_response.dart';
import 'package:http/http.dart' as http;

class Authorization extends GetConnect {
  Future<DefaultResponse> authorize() async {
    var body = jsonEncode(
      {
        'client_id': 'rIAi8hcBUd3uPLZQrdoPxMNZXr0J8pi1',
        'client_secre': 'AkGnWVJcVGVNQ4k1',
        'grant_type': 'client_credentials',
      },
    );
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request = http.Request(
      'POST',
      Uri.parse(
        'https://test.api.amadeus.com/v1/security/oauth2/token',
      ),
    );
    request.bodyFields = {
      'client_id': 'rIAi8hcBUd3uPLZQrdoPxMNZXr0J8pi1',
      'client_secret': 'AkGnWVJcVGVNQ4k1',
      'grant_type': 'client_credentials'
    };

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    late http.Response response1;
    Map<String, String> jsonx;
    var json = jsonDecode(
      await response.stream.bytesToString(),
    );

    if (response.statusCode == 200) {
      return AuthorizationResponse(
        statusCode: response.statusCode,
        status: "Abc",
        authorizationResponseModel: AuthorizationResponseModel(
          accessToken: json['access_token'],
        ),
      );
    } else {
      return ErrorResponse(
        statusCode: response.statusCode,
        status: "Abc",
      );
    }
  }
}
