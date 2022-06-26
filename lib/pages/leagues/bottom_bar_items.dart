import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/widgets/bars/bottom_bar.dart';
import 'package:stake_lane_web_app/routing/routes.dart';

List<BottomRawItem> bottomBarItems() {
  BottomRawItem pastItem = BottomRawItem(
    icon: Icons.view_timeline_outlined,
    subtitle: "Past",
    destination: LeaguePastFixturesPageRoute,
  );

  BottomRawItem fixtureItem = BottomRawItem(
    icon: Icons.sports_soccer,
    subtitle: "Fixtures",
    destination: LeaguePageRoute,
  );

  BottomRawItem editItem = BottomRawItem(
    icon: Icons.dashboard_customize,
    subtitle: "Edit",
    destination: LeagueEditPageRoute,
  );

  return [
    pastItem,
    fixtureItem,
    editItem,
  ];
}
