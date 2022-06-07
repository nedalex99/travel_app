import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/create_trip/create_trip_screen.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final AppBar? appBar;

  const BaseScaffold({
    Key? key,
    required this.body,
    this.bottomNavigationBar,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(
          () => CreateTripScreen(),
        ),
        tooltip: 'Add trip',
        child: const Icon(
          Icons.add,
        ),
        elevation: 2.0,
      ),
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      appBar: appBar,
    );
  }
}
