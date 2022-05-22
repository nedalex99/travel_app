import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/bottom_app_bar_item.dart';
import 'package:travel_app/ui/dashboard/dashboard_screen.dart';
import 'package:travel_app/ui/settings/settings_screen.dart';
import 'package:travel_app/ui/widgets/bottom_navigation_bar/bottom_app_bar_widget.dart';
import 'package:travel_app/utils/constants/colors.dart';

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FABBottomAppBar(
      items: [
        BottomAppBarItem(iconData: Icons.menu, text: 'Feed'),
        BottomAppBarItem(iconData: Icons.layers, text: 'Trips'),
        BottomAppBarItem(iconData: Icons.dashboard, text: 'Favourite'),
        BottomAppBarItem(iconData: Icons.info, text: 'Settings'),
      ],
      centerItemText: '',
      backgroundColor: kGeneralColor,
      color: Colors.black,
      selectedColor: Colors.white,
      notchedShape: const CircularNotchedRectangle(),
      onTabSelected: (value) {
        switch (value) {
          case 0:
            Get.to(
              () => DashboardScreen(),
            );
            break;
          case 3:
            Get.to(
              () => SettingsScreen(),
            );
            break;
          default:
            break;
        }
      },
    );
  }
}
