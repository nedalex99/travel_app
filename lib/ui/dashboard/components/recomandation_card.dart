import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel_app/model/recommendation_model.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/images.dart';
import 'package:travel_app/utils/constants/styles.dart';

class CardRecommendation extends StatelessWidget {
  RecommendationModel recommendationModel;

  // final String imageUrl;

  CardRecommendation({
    Key? key,
    //required this.imageUrl,
    required this.recommendationModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 40,
      decoration: BoxDecoration(
        color: kContainerRecommendation,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 5,
          left: 15,
          bottom: 5,
          right: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              kCity,
              scale: 0.9,
              width: 30,
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10,top: 20),
              child: Column(
                children: [
                  Text(
                    recommendationModel.name!,
                    style: kNormalTextStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RatingBarIndicator(
                      rating: recommendationModel.relevance!*10,
                      itemCount: 5,
                      itemSize: 20,
                      direction: Axis.horizontal,
                      itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amberAccent,
                          )),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
