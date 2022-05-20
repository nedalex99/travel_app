import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/city_screen/components/city_widget_controller.dart';

class CityWidget extends StatelessWidget {
  String cityName;
  double? heightSizedbox;
  double? widthSizedbox;
  double? positionedTop;
  double? positionedLeft;
  double? heightContainer;
  double? widthContainer;

  CityWidgetController controller;

  CityWidget({
    Key? key,
    required this.cityName,
    required this.controller,
    required this.heightSizedbox,
    required this.widthSizedbox,
    required this.positionedLeft,
    required this.positionedTop,
    required this.heightContainer,
    required this.widthContainer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: heightSizedbox,
        width: widthSizedbox,
        child: Stack(
          children: [
            Positioned(
              top: positionedTop,
              left: positionedLeft,
              height: heightContainer,
              width: widthContainer,
              child: GestureDetector(
                onTap: () {
                  controller.isSelected.value = !controller.isSelected.value;
                  controller.doCityList(cityName);
                   print(controller.cityList[0]);
                   print(controller.cityList[1]);
                   print(controller.cityList[2]);
                   print(controller.cityList.length);
                },
                child: Container(
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
                              color: Colors.red,
                            ),
                          ],
                        ),
                  child: Center(
                    child: Text(
                      cityName,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
