import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/routing/routes.dart';
import 'package:stake_lane_web_app/widgets/bars/bottom_bar.dart';

List<BottomRawItem> bottomBarItems() {
  BottomRawItem pastItem = BottomRawItem(
    icon: Icons.group_add,
    subtitle: "Create",
    destination: PoolsCreatePageRoute,
  );

  BottomRawItem fixtureItem = BottomRawItem(
    icon: Icons.group_rounded,
    subtitle: "My Pools",
    destination: PoolsPageRoute,
  );

  BottomRawItem editItem = BottomRawItem(
    icon: Icons.public,
    subtitle: "Public",
    destination: PoolsPublicPageRoute,
  );

  return [
    pastItem,
    fixtureItem,
    editItem,
  ];
}
