import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/widgets/bars/bottom_bar.dart';

class FriendsPageView extends StatelessWidget {
  const FriendsPageView({super.key});

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
                bottomBarItem(Icons.person_rounded, "List"),
                bottomBarItem(Icons.person_search_sharp, "Find"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
