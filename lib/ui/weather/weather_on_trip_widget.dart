import 'package:flutter/material.dart';
import 'package:travel_app/utils/constants/colors.dart';

class WeatherOnTripWidget extends StatelessWidget {
  final String iconUrl;
  final double? temp;

  const WeatherOnTripWidget({
    Key? key,
    required this.iconUrl,
    required this.temp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              iconUrl,
              width: 20.0,
              height: 20.0,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Text(
              '${temp!.toInt()}°C',
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
