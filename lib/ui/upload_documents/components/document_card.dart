import 'package:flutter/material.dart';
import 'package:travel_app/utils/constants/styles.dart';

class DocumentCard extends StatelessWidget {
  String nameDocument;
  String imgURL;

  DocumentCard({
    Key? key,
    required this.nameDocument,
    required this.imgURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              nameDocument,
              style: kNormalTextStyle,
            ),
          ),
          ClipRect(
            child: Image.network(
              imgURL,
              width: 150,
              height: 150,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
