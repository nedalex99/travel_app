import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app/model/authorization_response_model.dart';
import 'package:travel_app/utils/network/amadeus_api/authorization/authorization_response.dart';
import 'package:travel_app/utils/responses/default_response.dart';
import 'package:travel_app/utils/responses/error_response.dart';

class Authorization extends GetConnect {
  Future<DefaultResponse> authorize() async {
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    var request = http.Request(
      'POST',
      Uri.parse(
        'https://test.api.amadeus.com/v1/security/oauth2/token',
      ),
    );
    request.bodyFields = {
      'client_id': 'TY0LGMjhgGXxkzvANZisECuSPNbkw0fk',
      'client_secret': 'g3lz1fD2yFA8lH7D',
      'grant_type': 'client_credentials'
    };

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
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
