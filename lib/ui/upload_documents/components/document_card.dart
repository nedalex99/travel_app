import 'package:flutter/material.dart';
import 'package:travel_app/utils/constants/colors.dart';
import 'package:travel_app/utils/constants/styles.dart';

class DocumentCard extends StatelessWidget {
  final String nameDocument;
  final String imgURL;

  const DocumentCard({
    Key? key,
    required this.nameDocument,
    required this.imgURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        16.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(
            6.0,
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 1,
              color: Colors.grey,
            ),
          ],
        ),
        child: Column(
          children: [
            Image.network(
              imgURL,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                left: 8.0,
                bottom: 8.0,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  nameDocument,
                  style: kNormalTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
