import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/pages/friends/friends.dart';
import 'package:stake_lane_web_app/pages/friends/find.dart';
import 'package:stake_lane_web_app/pages/leagues/leagues.dart';
import 'package:stake_lane_web_app/pages/leagues/edit.dart';
import 'package:stake_lane_web_app/pages/leagues/past_dates.dart';
import 'package:stake_lane_web_app/pages/pools/pools.dart';
import 'package:stake_lane_web_app/pages/pools/create.dart';
import 'package:stake_lane_web_app/pages/pools/public.dart';
import 'package:stake_lane_web_app/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LeaguePageRoute:
      return _getPageRoute(const LeaguesPageView());
    case LeaguePastFixturesPageRoute:
      return _getPageRoute(const LeaguePastDatesPageView());
    case LeagueEditPageRoute:
      return _getPageRoute(const LeagueEditPageView());

    case PoolsPageRoute:
      return _getPageRoute(const PoolsPageView());
    case PoolsCreatePageRoute:
      return _getPageRoute(const PoolsCreatePageView());
    case PoolsPublicPageRoute:
      return _getPageRoute(const PoolPublicPageRoute());


    case FriendsPageRoute:
      return _getPageRoute(const FriendsPageView());
    case FriendsFindPageRoute:
      return _getPageRoute(const FriendsFindPageView());

    default:
      return _getPageRoute(const LeaguesPageView());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
