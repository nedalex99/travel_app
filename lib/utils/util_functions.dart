import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/model/notification_data.dart';
import 'package:travel_app/ui/widgets/notification_widget/notification_widget.dart';
import 'package:travel_app/utils/constants/enum.dart';
import 'package:travel_app/utils/constants/images.dart';

List<String> getWordsToSearch({
  required String text,
}) {
  List<String> caseSearchList = [];
  String caseSearch = "";
  for (int i = 0; i < text.length; i++) {
    caseSearch += text[i].toLowerCase();
    caseSearchList.add(caseSearch);
  }
  return caseSearchList;
}

void showNotification({
  required NotificationData notificationData,
}) {
  BotToast.showCustomNotification(
    toastBuilder: (cancel) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: NotificationWidget(
          notification: notificationData,
          onButtonTap: notificationData.onButtonTap != null
              ? () {
                  notificationData.onButtonTap!();
                  cancel();
                }
              : null,
          onWidgetCloseTap: cancel,
        ),
      );
    },
    animationDuration: Duration(
      milliseconds: 200,
    ),
    animationReverseDuration: Duration(
      milliseconds: 200,
    ),
    duration: Duration(seconds: 10),
    enableSlideOff: true,
  );
}

Image getImageFromNotificationType(NotificationType? notificationType) {
  switch (notificationType) {
    case NotificationType.ERROR:
      return Image.asset(
        kNotificationError,
        height: 36.0,
        width: 41.0,
      );
    case NotificationType.INFO:
      return Image.asset(
        kNotificationInfo,
        height: 39.0,
        width: 30.0,
      );
    case NotificationType.SUCCESS:
      return Image.asset(
        kNotificationSuccess,
        height: 37.0,
        width: 37.0,
      );
    default:
      return Image.asset("");
  }
}
