import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function? onTap;
  final String text;
  final Color backgroundColor;

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextButton(
        onPressed: onTap as void Function()?,
        child: Row(
          children: [
            Container(
              height: 40,
              width: 220,
              padding: const EdgeInsets.all(
                8,
              ),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    100,
                  ),
                ),
              ),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
