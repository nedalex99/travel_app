import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/base_scaffold.dart';
import 'package:travel_app/ui/settings/components/settings_card.dart';
import 'package:travel_app/ui/settings/settings_controller.dart';
import 'package:travel_app/ui/widgets/bottom_navigation_bar/bottom_nav_bar.dart';
import 'package:travel_app/ui/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/images.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  final SettingsController settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kGeneralColor.withOpacity(0.5),
          elevation: 3,
          leading: const BackButton(
            color: Colors.black,
          ),
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
                      text: 'Travel Album',
                      rightIcon: IconButton(
                        icon: Image.asset(
                          kSettingsArrow,
                        ),
                        onPressed: () {},
                      ),
                      leftIcon: IconButton(
                        icon: Image.asset(
                          kAlbum,
                        ),
                        onPressed: () {},
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
