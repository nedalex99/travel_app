import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/dashboard/components/city_buttons_controller.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';

class CityButtonsWidget extends StatelessWidget {
  String text;

  CityButtonsWidget({
    Key? key,
    required this.text,
    required this.controller,
  }) : super(key: key);

  CityButtonsController controller = CityButtonsController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        decoration: BoxDecoration(
          color: kGeneralColor,
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
          child: Obx(
            () => Column(
              children: [
                Text(
                  text,
                  style: controller.isSelected.value
                      ? kSelectedTextStyle
                      : kNormalTextStyle,
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: controller.isSelected.value
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
      ),
    );
  }
}
