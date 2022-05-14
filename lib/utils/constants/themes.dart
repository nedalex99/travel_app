import 'package:flutter/material.dart';
import 'package:travel_app/utils/constants/colors.dart';

final kMainTheme = ThemeData(
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  appBarTheme: const AppBarTheme(
    color: kBackgroundColor,
    elevation: 0,
  ),
  scaffoldBackgroundColor: kBackgroundColor,
  primaryColor: Colors.black,
  unselectedWidgetColor: Colors.grey,
);
