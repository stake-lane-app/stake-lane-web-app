import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/controllers/controllers.dart';
import 'package:stake_lane_web_app/routing/router.dart';
import 'package:stake_lane_web_app/routing/routes.dart';

Navigator localNavigator() => Navigator(
    key: navigationController.navigatorKey,
    initialRoute: LeaguePageRoute,
    onGenerateRoute: generateRoute,
  );
