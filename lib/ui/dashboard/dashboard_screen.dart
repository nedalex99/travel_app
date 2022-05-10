import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/base_scaffold.dart';
import 'package:travel_app/ui/dashboard/components/button_recomandation_widget.dart';
import 'package:travel_app/ui/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:travel_app/utils/constants/styles.dart';

import 'components/button_recommendation_controller.dart';
import 'components/recomandation_card.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  final List<String> imageList = [
    'https://upload.wikimedia.org/wikipedia/commons/6/69/Paris_montage2.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/7/75/Collage_Rome.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/c/ca/Bucharest_collage_02.jpg',
  ];
  //final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  // Future<String> getUserName() async {
  //   final CollectionReference users = FirebaseFirestore.instance.collection('users');
  //   final String? uid = _firebaseAuth.currentUser?.uid;
  //   final result = await users.doc(uid).get();
  //   return result.id;
  //
  // }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 18.0,
          top: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 60.0,
                left: 10.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/en/3/35/Supermanflying.png',
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Hello USERNAME!",
                    style: kNormalTextStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            const Text(
              'RECOMANDARI',
              style: kDefaultHeaderTextStyle,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonRecommendation(
                  controller: Get.put(
                    ButtonRecommendationController(),
                    tag: "button_1",
                  ),
                  text: 'For you',
                ),
                ButtonRecommendation(
                  controller: Get.put(
                    ButtonRecommendationController(),
                    tag: "button_2",
                  ),
                  text: 'Most Wanted',
                ),
                ButtonRecommendation(
                  controller: Get.put(
                    ButtonRecommendationController(),
                    tag: "button_3",
                  ),
                  text: 'For Landscapes',
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            CarouselSlider.builder(
              itemCount: imageList.length,
              itemBuilder: (context, index, realIndex) {
                final urlImage = imageList[index];
                return CardRecommendation(
                  imageUrl: urlImage,
                  text: 'TARA',
                );
              },
              options: CarouselOptions(
                height: 250,
                enableInfiniteScroll: false,
                viewportFraction: 0.6,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBarWidget(),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        child: Image.network(
          urlImage,
          fit: BoxFit.fill,
        ),
      );
}
