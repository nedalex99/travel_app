import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/weather_model.dart';
import 'package:travel_app/utils/constants/values.dart';

class WeatherOnTripWidget extends StatelessWidget {
  final Rx<Weather> weather;

  const WeatherOnTripWidget({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 40,
        width: 40,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                weather.value.condition != null
                    ? getWeatherImage(
                        weather.value.condition,
                      )
                    : getWeatherImage(300),
                width: 20.0,
                height: 20.0,
                fit: BoxFit.fill,
              ),
            ),
            Center(
                child: weather.value.temperature != null
                    ? Text(
                        '${weather.value.temperature!.toInt()} °C',
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : const Text(
                        '20 °C',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ))
          ],
        ),
      ),
    );
  }
}
