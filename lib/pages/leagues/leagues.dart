import 'package:stake_lane_web_app/pages/leagues/widgets/fixture_cards.dart';
import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/widgets/bars/bottom_bar.dart';

class LeaguesPageView extends StatelessWidget {
  const LeaguesPageView({super.key});

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
                children: const [FixtureCards()],
              ),
            ),
            BottomBar(
              bottomBarItems: [
                bottomBarItem(Icons.view_timeline_outlined, "Past"),
                bottomBarItem(Icons.sports_soccer, "Fixtures"),
                
                // Edit will include show current user's league, filtering, add/remove
                bottomBarItem(Icons.dashboard_customize, "Edit"),
                
                // bottomBarItem(Icons.filter_alt, "Filter"),
                // bottomBarItem(Icons.add, "Add"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
