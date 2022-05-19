import 'package:flutter/material.dart';
import 'package:travel_app/model/bottom_app_bar_item.dart';
import 'package:travel_app/ui/widgets/bottom_navigation_bar/bottom_app_bar_widget.dart';
import 'package:travel_app/utils/constants/colors.dart';

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FABBottomAppBar(
      items: [
        BottomAppBarItem(iconData: Icons.menu, text: 'Feed'),
        BottomAppBarItem(iconData: Icons.layers, text: 'Trips'),
        BottomAppBarItem(iconData: Icons.dashboard, text: 'Favourite'),
        BottomAppBarItem(iconData: Icons.info, text: 'Settings'),
      ],
      centerItemText: '',
      backgroundColor: kGeneralColor,
      color: Colors.black,
      selectedColor: Colors.white,
      notchedShape: const CircularNotchedRectangle(),
      onTabSelected: (value) {},
    );
  }
}
