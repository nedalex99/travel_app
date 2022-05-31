import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/intro_screen_model.dart';
import 'package:travel_app/ui/login/login_screen.dart';
import 'package:travel_app/ui/register/register_screen.dart';
import 'package:travel_app/ui/widgets/buttons/custom_button.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/images.dart';

class IntroScreens extends StatelessWidget {
  final List<IntroScreenModel> list = [
    IntroScreenModel(
      image: kFirstImage,
      title: 'Find hidden gems',
      description:
          'Explore your favourite destinations with us around the world',
    ),
    IntroScreenModel(
      image: kSecondImage,
      title: 'Book on the go',
      description:
          'Explore your favourite destinations with us around the world',
    ),
    IntroScreenModel(
      image: kThirdImage,
      title: 'Go explore!',
      description:
          'Explore your favourite destinations with us around the world',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        itemBuilder: (context, index) {
          return SafeArea(
            child: Column(
              children: [
                Image.asset(
                  list[index].image,
                ),
                Text(
                  list[index].title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 26.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  list[index].description,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 5,
                      width: index == 0 ? 30 : 15,
                      decoration: BoxDecoration(
                        color: index == 0
                            ? kGeneralColor
                            : kGeneralColor.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(
                          6.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Container(
                      height: 5,
                      width: index == 1 ? 30 : 15,
                      decoration: BoxDecoration(
                        color: index == 1
                            ? kGeneralColor
                            : kGeneralColor.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(
                          6.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Container(
                      height: 5,
                      width: index == 2 ? 30 : 15,
                      decoration: BoxDecoration(
                        color: index == 2
                            ? kGeneralColor
                            : kGeneralColor.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(
                          6.0,
                        ),
                      ),
                    ),
                  ],
                ),
                index == 2
                    ? Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 24.0,
                            ),
                            child: CustomButton(
                              onTap: () => Get.to(
                                () => LoginScreen(),
                              ),
                              text: 'Next',
                              backgroundColor: kGeneralColor,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          );
        },
        itemCount: 3,
      ),
    );
  }
}
