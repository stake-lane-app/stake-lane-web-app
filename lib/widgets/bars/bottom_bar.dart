import 'package:stake_lane_web_app/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/helpers/responsiveness.dart';

BottomNavigationBar? bottomBar(
  widget,
  pageList,
  setState,
  context,
  bottomBarItems,
) {
  void changePageNavigation(value) {
    setState(() {
      widget.pageIndex = value;
    });
  }

  if (ResponsiveWidget.isSmallScreen(context)) {
    return BottomNavigationBar(
      currentIndex: widget.pageIndex,
      onTap: (value) {
        changePageNavigation(value);
      },
      type: BottomNavigationBarType.fixed,
      items: bottomBarItems,
      selectedItemColor: activeColdColor,
      unselectedItemColor: dark,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 13.0,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      ),
    );
  }

  return null;
}
