import 'package:flutter/material.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';

class CardRecommendation extends StatelessWidget {
  final String text;
  final String imageUrl;

  CardRecommendation({
    Key? key,
    required this.text,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 250,
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
        child: Column(
          children: [
            Image.network(
              imageUrl,
              width:200,
              height: 200,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              text,
              style: kNormalTextStyle,
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
