import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app/model/weather_model.dart';
import 'package:travel_app/utils/network/open_weather_api/get_weather_response.dart';
import 'package:travel_app/utils/responses/default_response.dart';
import 'package:travel_app/utils/responses/error_response.dart';
import 'package:travel_app/utils/session_temp.dart';

class WeatherSearch extends GetConnect {
  Future<DefaultResponse> getData({required String cityName}) async {
    try {
      var request = http.Request(
        'GET',
        Uri.parse('$baseUrl?q=$cityName&appid=$apiKey&units=metric'),
      );

      http.StreamedResponse response = await request.send().timeout(
            Duration(
              seconds: 10,
            ),
          );
      var json = jsonDecode(
        await response.stream.bytesToString(),
      );

      if (response.statusCode == 200) {
        return GetWeatherResponse(
          statusCode: 200,
          status: "success",
          weather: Weather.fromJson(json),
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
