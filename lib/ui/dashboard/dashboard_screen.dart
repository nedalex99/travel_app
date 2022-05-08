import 'package:flutter/material.dart';
import 'package:travel_app/ui/base_scaffold.dart';
import 'package:travel_app/ui/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      body: Center(
        child: Text("In dashboard"),
      ),
      bottomNavigationBar: BottomAppBarWidget(),
    );
  }
}
