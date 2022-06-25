import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/widgets/bars/bottom_bar.dart';

List<BottomRawItem> bottomBarItems() {
  BottomRawItem pastItem = BottomRawItem(
    icon: Icons.view_timeline_outlined,
    subtitle: "Past",
    destination: "LeaguePastFixtures",
  );

  BottomRawItem fixtureItem = BottomRawItem(
    icon: Icons.sports_soccer,
    subtitle: "Fixtures",
    destination: "Leagues",
  );

  BottomRawItem editItem = BottomRawItem(
    icon: Icons.dashboard_customize,
    subtitle: "Edit",
    destination: "LeagueEdit",
  );

  return [
    pastItem,
    fixtureItem,
    editItem,
  ];
}
