import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/city_screen/city_screen_controller.dart';
import 'package:travel_app/ui/city_screen/components/city_widget_controller.dart';
import 'package:travel_app/utils/constants/colors.dart';

class CityWidget extends StatelessWidget {
  final String cityName;
  final String cityImage;
  CityScreenController cityScreenController = Get.find();

  CityWidgetController controller;

  CityWidget({
    Key? key,
    required this.cityName,
    required this.cityImage,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.isSelected.value = !controller.isSelected.value;
          if (controller.isSelected.value) {
            cityScreenController.doCityList(cityName);
          } else {
            cityScreenController.cityList
                .removeWhere((element) => element == cityName);
          }
        },
        child: Container(
          height: 90,
          width: 90,
          decoration: controller.isSelected.value == false
              ? const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 5,
                      color: Colors.black,
                    ),
                  ],
                )
              : const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 5,
                      color: kDarkColor,
                    ),
                  ],
                ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cityName,
              ),
              const SizedBox(
                height: 8,
              ),
              Image.asset(cityImage),
            ],
          ),
        ),
      ),
    );
  }
}
