import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/widgets/bars/bottom_bar.dart';
import 'package:stake_lane_web_app/routing/routes.dart';

List<BottomRawItem> bottomBarItems() {
  BottomRawItem listItem = BottomRawItem(
    icon: Icons.person_rounded,
    subtitle: "List",
    destination: FriendsPageRoute,
  );

  BottomRawItem findItem = BottomRawItem(
    icon: Icons.person_search_sharp,
    subtitle: "Find",
    destination: FriendsFindPageRoute,
  );

  return [
    listItem,
    findItem,
  ];
}
