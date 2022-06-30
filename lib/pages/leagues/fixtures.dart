import 'package:stake_lane_web_app/pages/leagues/widgets/fixture_cards.dart';
import 'package:flutter/material.dart';

class LeaguesFixturesPageView extends StatelessWidget {
  const LeaguesFixturesPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(top: 0),
            scrollDirection: Axis.vertical,
            children: [FixtureCards(page: 0)],
          ),
        ),
      ],
    );
  }
}
