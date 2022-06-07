import 'package:flutter/material.dart';
import 'package:travel_app/ui/intro_screens/intro_screens.dart';
import 'package:lottie/lottie.dart';
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
        backgroundColor: kWithe,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  const Text(
                    'Welcome to Plan&Go',
                    style: TextStyle(
                      color: kGeneralColor,
                      fontSize: 32.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  const Text(
                    'Plan your trip and explore your favourite destinations with us.',
                    style: TextStyle(
                      color: kDark2Color,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 400,
                      child: Lottie.asset('assets/lottie/travel-world.json'),
                    ),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              fillOverscroll: false,
              hasScrollBody: false,
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
            )
          ],
        ),
      ),
    );
  }
}
