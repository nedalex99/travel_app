import 'package:get/get.dart';
import 'package:travel_app/model/weather_model.dart';
import 'package:travel_app/utils/responses/default_response.dart';

class GetWeatherResponse extends DefaultResponse {
  GetWeatherResponse({
    required int statusCode,
    required String status,
    required this.weather,
  }) : super(statusCode: statusCode, status: status);
  Weather weather;
}
