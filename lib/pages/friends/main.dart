import 'package:stake_lane_web_app/pages/friends/find.dart';
import 'package:stake_lane_web_app/pages/friends/friends.dart';
import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/widgets/bars/bottom_bar.dart';

class MainFriendView extends StatefulWidget {
  int pageIndex = 1;
  MainFriendView({super.key});

  @override
  State<MainFriendView> createState() => _MainFriendViewState();
}

class _MainFriendViewState extends State<MainFriendView> {
  List<Widget> pageList = <Widget>[
    const FriendsFindPageView(),
    const FriendsListPageView(),
  ];

  List<BottomNavigationBarItem> bottomBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.person_rounded),
      label: "List",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_search_sharp),
      label: "Find",
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
