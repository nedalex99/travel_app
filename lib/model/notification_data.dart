import 'package:flutter/material.dart';
import 'package:travel_app/utils/constants/enum.dart';

class NotificationData {
  NotificationType notificationType;
  String title;
  RichText description;
  Function? onButtonTap;

  NotificationData({
    required this.notificationType,
    required this.title,
    required this.description,
    this.onButtonTap,
  });
}
