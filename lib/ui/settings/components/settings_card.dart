import 'package:flutter/material.dart';
import 'package:travel_app/utils/constants/styles.dart';

class SettingsCard extends StatelessWidget {
  final String? text;
  final IconButton? rightIcon;
  final IconButton? leftIcon;
  final Function? onClick;

  SettingsCard({
    Key? key,
    this.text,
    this.leftIcon,
    this.rightIcon,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick as void Function()?,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 24.0,
          right: 24.0,
          bottom: 16.0,
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        8.0,
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFe6e6e6),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 11.0,
                      top: 10.0,
                      bottom: 10.0,
                      right: 14.0,
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 5,
                          ),
                        ),
                        IconButton(
                          icon: leftIcon!,
                          iconSize: 40,
                          onPressed: () {},
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 18,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            text!,
                            style: kNormalTextStyle,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: rightIcon!,
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
