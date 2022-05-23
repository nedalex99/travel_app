import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travel_app/model/location_score_model.dart';
import 'package:travel_app/model/recommendation_model.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/images.dart';
import 'package:travel_app/utils/constants/styles.dart';

class CardRecommendation extends StatelessWidget {
  RecommendationModel recommendationModel;
  LocationScoreModel locationScoreModel;

  // final String imageUrl;

  CardRecommendation({
    Key? key,
    //required this.imageUrl,
    required this.recommendationModel,
    required this.locationScoreModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 360,
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
              padding: const EdgeInsets.only(
                left: 10,
                right: 8,
                bottom: 10,
              ),
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
                    rating: recommendationModel.relevance! * 10,
                    itemCount: 5,
                    itemSize: 20,
                    direction: Axis.horizontal,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amberAccent,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 5,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "Restaurant: ",
                        ),
                        RatingBarIndicator(
                          rating: locationScoreModel
                              .categoryScores!.restaurant!.overall!
                              .toDouble(),
                          itemCount: 5,
                          itemSize: 20,
                          direction: Axis.horizontal,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amberAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "Shopping: ",
                        ),
                        RatingBarIndicator(
                          rating: locationScoreModel
                              .categoryScores!.shopping!.overall!
                              .toDouble(),
                          itemCount: 5,
                          itemSize: 20,
                          direction: Axis.horizontal,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amberAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "Night Life: ",
                        ),
                        RatingBarIndicator(
                          rating: locationScoreModel
                              .categoryScores!.nightLife!.overall!
                              .toDouble(),
                          itemCount: 5,
                          itemSize: 20,
                          direction: Axis.horizontal,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amberAccent,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
