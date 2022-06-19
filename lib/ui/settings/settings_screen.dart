import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/create_trip/create_trip_screen.dart';
import 'package:travel_app/ui/settings/components/settings_card.dart';
import 'package:travel_app/ui/settings/settings_controller.dart';
import 'package:travel_app/ui/widgets/bottom_navigation_bar/bottom_nav_bar.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/images.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  final SettingsController settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(
            () => CreateTripScreen(),
          ),
          tooltip: 'Add trip',
          child: const Icon(
            Icons.add,
          ),
          elevation: 2.0,
        ),
        appBar: AppBar(
          backgroundColor: kGeneralColor.withOpacity(0.5),
          elevation: 3,
          title: const Text(
            "Settings",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Column(
                  children: [
                    SettingsCard(
                      onClick:
                          settingsController.redirectAccountInformationScreen,
                      text: 'Account Information',
                      rightIcon: IconButton(
                        icon: Image.asset(
                          kSettingsArrow,
                        ),
                        onPressed: () {
                          settingsController.redirectAccountInformationScreen();
                        },
                      ),
                      leftIcon: IconButton(
                        icon: Image.asset(
                          kAccountInformation,
                        ),
                        onPressed: () {
                          settingsController.redirectAccountInformationScreen();
                        },
                      ),
                    ),
                    SettingsCard(
                      text: 'Change Password',
                      onClick: settingsController.redirectChangePasswordScreen,
                      rightIcon: IconButton(
                        icon: Image.asset(
                          kSettingsArrow,
                        ),
                        onPressed: () {
                          settingsController.redirectChangePasswordScreen();
                        },
                      ),
                      leftIcon: IconButton(
                        icon: Image.asset(
                          kChangePassword,
                        ),
                        onPressed: () {
                          settingsController.redirectChangePasswordScreen();
                        },
                      ),
                    ),
                    SettingsCard(
                      text: 'Budget',
                      rightIcon: IconButton(
                        icon: Image.asset(
                          kSettingsArrow,
                        ),
                        onPressed: () {},
                      ),
                      leftIcon: IconButton(
                        icon: Image.asset(
                          kBudget,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SettingsCard(
                      onClick: settingsController.redirectTravelAlbumScreen,
                      text: 'Travel Album',
                      rightIcon: IconButton(
                        icon: Image.asset(
                          kSettingsArrow,
                        ),
                        onPressed: () {
                          settingsController.redirectTravelAlbumScreen();
                        },
                      ),
                      leftIcon: IconButton(
                        icon: Image.asset(
                          kAlbum,
                        ),
                        onPressed: () {
                          settingsController.redirectTravelAlbumScreen();
                        },
                      ),
                    ),
                    SettingsCard(
                      text: 'Documents',
                      onClick: settingsController.redirectDocumentsScreen,
                      rightIcon: IconButton(
                        icon: Image.asset(
                          kSettingsArrow,
                        ),
                        onPressed: () {
                          settingsController.redirectDocumentsScreen();
                        },
                      ),
                      leftIcon: IconButton(
                        icon: Image.asset(
                          kDocuments,
                        ),
                        onPressed: () {
                          settingsController.redirectDocumentsScreen();
                        },
                      ),
                    ),
                    CustomButton(
                      onTap: () {
                        settingsController.logOut();
                      },
                      text: "Log out",
                      backgroundColor: kGeneralColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBar(
          selectedIndex: 4,
        ),
      ),
    );
  }
}
