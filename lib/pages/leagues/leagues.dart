import 'package:stake_lane_web_app/pages/leagues/widgets/cards_large_screen.dart';
import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/widgets/bars/top_bar.dart';
import 'package:stake_lane_web_app/widgets/bars/bottom_bar.dart';

class LeaguesPageView extends StatelessWidget {
  const LeaguesPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SuperTopBar(),
            // TopBar(activeButton: "Leagues"),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 0),
                scrollDirection: Axis.vertical,
                children: const [CardsLargeScreen()],
              ),
            ),
            BottomBar(
              bottomBarItems: [
                bottomBarItem(Icons.add, "Add League"),
                bottomBarItem(Icons.filter_alt, "Filter"),
                bottomBarItem(Icons.view_timeline_outlined, "Past Dates"),
              ],
            )
          ],
        ),
      ],
    );
  }
}
