import 'dart:js';

import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/pages/friends/friends.dart';
import 'package:stake_lane_web_app/pages/leagues/leagues.dart';
import 'package:stake_lane_web_app/pages/pools/pools.dart';
import 'package:stake_lane_web_app/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LeaguePageRoute:
      return _getPageRoute(const LeaguesPageView());
    case PoolPageRoute:
      return _getPageRoute(const PoolsPageView());
    case FriendsPageRoute:
      return _getPageRoute(const FriendsPageView());
    default:
      return _getPageRoute(const LeaguesPageView());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
