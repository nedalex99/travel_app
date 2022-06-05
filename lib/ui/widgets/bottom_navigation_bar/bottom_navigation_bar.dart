import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/bottom_app_bar_item.dart';
import 'package:travel_app/ui/dashboard/dashboard_screen.dart';
import 'package:travel_app/ui/login/login_controller.dart';
import 'package:travel_app/ui/settings/settings_screen.dart';
import 'package:travel_app/ui/trips/trips_screen.dart';
import 'package:travel_app/ui/widgets/bottom_navigation_bar/bottom_app_bar_widget.dart';
import 'package:travel_app/utils/constants/colors.dart';

class BottomAppBarWidget extends StatelessWidget {
  BottomAppBarWidget({Key? key}) : super(key: key);
  LoginController loginController = LoginController();

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
            loginController.getCitiesForUser().then(
                  (value) => Get.off(
                    () => DashboardScreen(
                      cityOne: loginController.data['city1'],
                      cityTwo: loginController.data['city2'],
                      cityThree: loginController.data['city3'],
                    ),
                    transition: Transition.noTransition,
                  ),
                );
            break;
          case 1:
            Get.off(
              () => TripsScreen(),
              transition: Transition.noTransition,
            );
            break;
          case 3:
            Get.off(
              () => SettingsScreen(),
              transition: Transition.noTransition,
            );
            break;
          default:
            break;
        }
      },
    );
  }
}
