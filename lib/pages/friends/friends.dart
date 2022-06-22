import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/widgets/bars/top_bar.dart';
import 'package:stake_lane_web_app/widgets/bars/bottom_bar.dart';

class FriendsPageView extends StatelessWidget {
  const FriendsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Column(
          children: [
            TopBar(activeButton: "Friends"),
            Expanded(
              // flex: 0,
              child: ListView(
                padding: const EdgeInsets.only(top: 0),
                scrollDirection: Axis.vertical,
                children: const [],
              ),
            ),
            BottomBar(
              bottomBarItems: [
                bottomBarItem(Icons.person_rounded, "Close Stakers"),
                bottomBarItem(Icons.person_search_sharp, "Find Stakers"),
              ],
            )
          ],
        ),
      ],
    );
  }
}
