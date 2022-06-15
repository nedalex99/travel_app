import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/utils/constants/colors.dart';

class WeatherWidget extends StatelessWidget {
  final String iconUrl;
  final String description;
  final double temp;

  const WeatherWidget({
    Key? key,
    required this.iconUrl,
    required this.description,
    required this.temp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kContainerRecommendation,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              iconUrl,
              width: 50.0,
              height: 40.0,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            description.capitalizeFirst!,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Center(
              child: Text(
                '${temp.toInt()}°C',
                style: const TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
