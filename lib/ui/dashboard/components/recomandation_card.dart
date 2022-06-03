import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:travel_app/model/recommendation_model.dart';
import 'package:travel_app/ui/city_details/city_details.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/images.dart';
import 'package:travel_app/utils/constants/styles.dart';
import 'package:travel_app/utils/constants/values.dart';

class CardRecommendation extends StatelessWidget {
  RecommendationModel recommendationModel;

  CardRecommendation({
    Key? key,
    required this.recommendationModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => CityDetails(
            recommendationModel: recommendationModel,
          ),
        );
      },
      child: Container(
        width: 230,
        height: 330,
        decoration: BoxDecoration(
          color: kContainerRecommendation,
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            right: 15,
          ),
          child: Row(
            children: [
              Container(
                height: 365,
                width: 15,
                decoration: BoxDecoration(
                  color: kDarkColor,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 10,
                  bottom: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recommendationModel.name!,
                      style: kLittleTextStyle,
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
                    const Divider(
                      color: Colors.black,
                      height: 10.0,
                      thickness: 3,
                      indent: 90,
                      endIndent: 90,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          returnIcon(recommendationModel.name!),
                          scale: 0.9,
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                            "General note: ${(recommendationModel.relevance! * 10).toStringAsFixed(2)} ",
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Image.asset(kDots),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
