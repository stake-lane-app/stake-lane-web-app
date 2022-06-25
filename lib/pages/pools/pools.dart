import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/widgets/bars/bottom_bar.dart';

class PoolsPageView extends StatelessWidget {
  const PoolsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 0),
                scrollDirection: Axis.vertical,
                children: const [],
              ),
            ),
            BottomBar(
              bottomBarItems: [
                bottomBarItem(Icons.group_add, "Create"),
                bottomBarItem(Icons.groups_rounded, "My Pools"),
                // NOT AT MVP
                bottomBarItem(Icons.public, "Public"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
