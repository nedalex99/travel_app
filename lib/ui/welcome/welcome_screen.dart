import 'package:flutter/material.dart';
import 'package:travel_app/ui/intro_screens/intro_screens.dart';
import 'package:travel_app/ui/login/login_screen.dart';
import 'package:travel_app/ui/register/register_screen.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/images.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    kWelcomeImage,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: Get.height / 2,
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 128,
                      ),
                      Center(
                        child: Text(
                          'Welcome to Plan&Go',
                          style: TextStyle(
                            color: kGeneralColor,
                            fontSize: 32.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      Center(
                        child: Text(
                          'Plan your trip and explore your favourite destinations with us.',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 24.0,
                      ),
                      child: CustomButton(
                        onTap: () => Get.to(
                          () => IntroScreens(),
                        ),
                        text: 'Get started',
                        backgroundColor: kGeneralColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
