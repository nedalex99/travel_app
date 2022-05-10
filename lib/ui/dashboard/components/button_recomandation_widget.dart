import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';

import 'button_recommendation_controller.dart';

class ButtonRecommendation extends StatelessWidget {
  final String text;
  final RxBool isSelected = false.obs;
  final ButtonRecommendationController controller;

  List<String> imageList = [
    'https://upload.wikimedia.org/wikipedia/commons/6/69/Paris_montage2.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/7/75/Collage_Rome.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/c/ca/Bucharest_collage_02.jpg',
  ];
  List<String> imageList2 = [
    'https://upload.wikimedia.org/wikipedia/commons/6/69/Paris_montage2.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/7/75/Collage_Rome.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/c/ca/Bucharest_collage_02.jpg',
  ];
  List<String> imageList3 = [
    'https://upload.wikimedia.org/wikipedia/commons/6/69/Paris_montage2.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/7/75/Collage_Rome.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/c/ca/Bucharest_collage_02.jpg',
  ];

  ButtonRecommendation({
    Key? key,
    required this.text,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (text == 'For you') {
          //return imageList;
        } else if (text == 'Most Wanted') {
          //return imageList2;
        } else if (text == 'For Landscapes') {
          //return imageList3;
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
