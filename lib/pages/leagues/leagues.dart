import 'package:stake_lane_web_app/constants/style.dart';
import 'package:stake_lane_web_app/pages/leagues/widgets/cards_large_screen.dart';
import 'package:stake_lane_web_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/helpers/responsiveness.dart';

Widget bottomBarItem(icon, subtitle) {
  return SizedBox(
    width: 90,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: dark,
        ),
        CustomText(
          size: 12,
          color: dark,
          text: subtitle,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget smallScreenBottomBar(context, width) {
  if (ResponsiveWidget.isLargeScreen(context)) {
    return Container();
  }

  return Positioned(
    bottom: 0,
    child: Container(
      width: width,
      height: 65,
      decoration: (BoxDecoration(
        border: Border(
          top: BorderSide(
            color: dark.withOpacity(.1),
            width: 1.0,
          ),
        ),
        color: Colors.grey[100],
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          bottomBarItem(Icons.add, "Add League"),
          bottomBarItem(Icons.filter_alt, "Filter"),
          bottomBarItem(Icons.view_timeline_outlined, "Past Dates"),
        ],
      ),
    ),
  );
}

Widget topBarItem(icon, subtitle) {
  return SizedBox(
    width: 110,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: dark,
        ),
        const SizedBox(
          width: 4,
        ),
        CustomText(
          size: 16,
          color: dark,
          text: subtitle,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget smallScreenTopBar(context, width) {
  if (ResponsiveWidget.isLargeScreen(context)) {
    return Container();
  }

  return Positioned(
    top: 0,
    child: Container(
      width: width,
      height: 65,
      decoration: (BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: dark.withOpacity(.1),
            width: 1.0,
          ),
        ),
        color: Colors.grey[100],
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          topBarItem(Icons.group, "Pools"),
          topBarItem(Icons.stadium, "Leagues"),
          topBarItem(Icons.person_add, "Friends"),
        ],
      ),
    ),
  );
}

class LeaguesPageView extends StatelessWidget {
  const LeaguesPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Column(
          children: [
            smallScreenTopBar(context, width),
            Expanded(
              // flex: 0,
              child: ListView(
                padding: const EdgeInsets.only(top: 0),
                scrollDirection: Axis.vertical,
                children: const [CardsLargeScreen()],
              ),
            ),
            smallScreenBottomBar(context, width)
          ],
        ),
      ],
    );
  }
}
