import 'package:stake_lane_web_app/pages/pools/create.dart';
import 'package:stake_lane_web_app/pages/pools/pools.dart';
import 'package:stake_lane_web_app/pages/pools/public.dart';
import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/widgets/bars/bottom_bar.dart';

class MainPoolView extends StatefulWidget {
  int pageIndex = 1;
  MainPoolView({super.key});

  @override
  State<MainPoolView> createState() => _MainPoolViewState();
}

class _MainPoolViewState extends State<MainPoolView> {
  List<Widget> pageList = <Widget>[
    const PoolsCreatePageView(),
    const PoolsMyPageView(),
    const PoolPublicPageRoute(),
  ];

  List<BottomNavigationBarItem> bottomBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.group_add),
      label: "Create",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.group_rounded),
      label: "My Pools",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.public),
      label: "Public",
    ),
  ];

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    SafeArea? bottomNavigationBar = bottomBar(
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
