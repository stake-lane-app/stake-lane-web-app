import 'package:flutter/material.dart';

import 'package:stake_lane_web_app/pages/friends/main.dart';
import 'package:stake_lane_web_app/pages/friends/friends.dart';
import 'package:stake_lane_web_app/pages/friends/find.dart';

import 'package:stake_lane_web_app/pages/leagues/main.dart';
import 'package:stake_lane_web_app/pages/leagues/fixtures.dart';
import 'package:stake_lane_web_app/pages/leagues/edit.dart';
import 'package:stake_lane_web_app/pages/leagues/past_dates.dart';

import 'package:stake_lane_web_app/pages/pools/main.dart';
import 'package:stake_lane_web_app/pages/pools/pools.dart';
import 'package:stake_lane_web_app/pages/pools/create.dart';
import 'package:stake_lane_web_app/pages/pools/public.dart';

import 'package:stake_lane_web_app/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LeaguePageRoute:
      return _getPageRoute(MainLeagueView());
    case LeagueFixturesPageRoute:
      return _getPageRoute(const LeaguesFixturesPageView());
    case LeaguePastFixturesPageRoute:
      return _getPageRoute(const LeaguePastDatesPageView());
    case LeagueEditPageRoute:
      return _getPageRoute(const LeagueEditPageView());

    case PoolsPageRoute:
      return _getPageRoute(MainPoolView());
    case PoolsMyPageRoute:
      return _getPageRoute(const PoolsMyPageView());
    case PoolsCreatePageRoute:
      return _getPageRoute(const PoolsCreatePageView());
    case PoolsPublicPageRoute:
      return _getPageRoute(const PoolPublicPageRoute());

    case FriendsPageRoute:
      return _getPageRoute(MainFriendView());
    case FriendsListPageRoute:
      return _getPageRoute(const FriendsListPageView());
    case FriendsFindPageRoute:
      return _getPageRoute(const FriendsFindPageView());

    default:
      return _getPageRoute(MainLeagueView());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
