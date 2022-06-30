import 'package:stake_lane_web_app/pages/leagues/edit.dart';
import 'package:stake_lane_web_app/pages/leagues/past_dates.dart';
import 'package:stake_lane_web_app/pages/leagues/fixtures.dart';
import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/widgets/bars/bottom_bar.dart';

class MainLeagueView extends StatefulWidget {
  int pageIndex = 1;
  MainLeagueView({super.key});

  @override
  State<MainLeagueView> createState() => _MainLeagueViewState();
}

class _MainLeagueViewState extends State<MainLeagueView> {
  List<Widget> pageList = <Widget>[
    const LeaguePastDatesPageView(),
    const LeaguesFixturesPageView(),
    const LeagueEditPageView(),
  ];

  List<BottomNavigationBarItem> bottomBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.view_timeline_outlined),
      label: "Past",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_soccer),
      label: "Fixtures",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.dashboard_customize),
      label: "Edit",
    ),
  ];

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    BottomNavigationBar? bottomNavigationBar = bottomBar(
      widget,
      pageList,
      setState,
      context,
      bottomBarItems,
    );

    return Scaffold(
      body: pageList[widget.pageIndex],
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
