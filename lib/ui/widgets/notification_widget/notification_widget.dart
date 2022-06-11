import 'package:flutter/material.dart';
import 'package:travel_app/model/notification_data.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';
import 'package:travel_app/utils/util_functions.dart';

class NotificationWidget extends StatelessWidget {
  final NotificationData? notification;
  final Function? onWidgetCloseTap;
  final Function? onButtonTap;

  NotificationWidget({
    required this.notification,
    required this.onButtonTap,
    this.onWidgetCloseTap,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Material(
          elevation: 50.0,
          borderRadius: BorderRadius.circular(10),
          child: GestureDetector(
            onTap: onWidgetCloseTap as void Function()?,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 18.0,
                horizontal: 26.0,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "images/add-friend.png",
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(
                        width: 17.0,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              notification!.title,
                              style: kNotificationTitleTextStyle,
                            ),
                            const SizedBox(
                              height: 7.0,
                            ),
                            notification!.description,
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
