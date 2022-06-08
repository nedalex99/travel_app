import 'package:flutter/material.dart';
import 'package:travel_app/utils/constants/styles.dart';

import '../../utils/constants/images.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.asset(kEmpty),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'No items yet.',
              style: kTitleColoredTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
