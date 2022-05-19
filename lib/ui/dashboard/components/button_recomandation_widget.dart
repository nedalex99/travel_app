import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/dashboard/dashboard_controller.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';

import 'button_recommendation_controller.dart';

class ButtonRecommendation extends StatelessWidget {
  final String text;
  final RxBool isSelected = false.obs;
  final ButtonRecommendationController controller;
  final DashboardController dashboardController = Get.find();


  ButtonRecommendation({
    Key? key,
    required this.text,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (text == 'PAR') {
          controller.cityRecommendation = text.obs;
          controller.getRecommendation();
        } else if (text == 'LIS') {
          controller.cityRecommendation = text.obs;
        } else if (text == 'OPO') {
          controller.cityRecommendation = text.obs;
        }
        controller.isSelected.value = !controller.isSelected.value;
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 5,
            left: 15,
            bottom: 5,
            right: 15,
          ),
          child: Column(
            children: [
              Text(
                text,
                style: isSelected.value ? kSelectedTextStyle : kNormalTextStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: isSelected.value
                      ? kSelectedContainerRecommendation
                      : kContainerRecommendation,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
