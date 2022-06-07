import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/dashboard/dashboard_screen.dart';
import 'package:travel_app/ui/login/login_controller.dart';
import 'package:travel_app/ui/settings/settings_screen.dart';
import 'package:travel_app/ui/trips/trips_screen.dart';
import 'package:travel_app/utils/constants/colors.dart';

class BottomNavBar extends StatelessWidget {
  final LoginController loginController = LoginController();

  BottomNavBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: handleTabBarItem(
            Icons.home,
            0,
          ),
          label: "",
          tooltip: "",
        ),
        BottomNavigationBarItem(
          icon: handleTabBarItem(
            Icons.list,
            1,
          ),
          label: "",
          tooltip: "",
        ),
        BottomNavigationBarItem(
          icon: handleTabBarItem(
            Icons.add,
            2,
          ),
          label: "",
          tooltip: "",
        ),
        BottomNavigationBarItem(
          icon: handleTabBarItem(
            Icons.heart_broken,
            3,
          ),
          label: "",
          tooltip: "",
        ),
        BottomNavigationBarItem(
          icon: handleTabBarItem(
            Icons.settings,
            4,
          ),
          label: "",
          tooltip: "",
        ),
      ],
      onTap: onItemTap,
      backgroundColor: kGeneralColor,
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      elevation: 1,
    );
  }

  Widget handleTabBarItem(IconData iconData, int itemNumber) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        100,
      ),
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: itemNumber == selectedIndex ? kSelectedItemBackground : null,
        ),
        child: Icon(
          iconData,
          color: itemNumber == 2 ? Colors.transparent : Colors.white,
        ),
      ),
    );
  }

  void onItemTap(int index) {
    if (index != selectedIndex) {
      switch (index) {
        case 0:
          loginController.getCitiesForUser().then(
                (value) => Get.offAll(
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
          Get.offAll(
            TripsScreen(),
            transition: Transition.noTransition,
          );
          break;
        case 3:
          Get.offAll(
            SettingsScreen(),
            transition: Transition.noTransition,
          );
          break;
      }
    }
  }
}
