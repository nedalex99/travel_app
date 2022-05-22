import 'package:flutter/material.dart';
import 'package:travel_app/ui/base_scaffold.dart';
import 'package:travel_app/ui/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BaseScaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: const [
                  Text(
                    'Settings',
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomAppBarWidget(),
      ),
    );
  }
}
