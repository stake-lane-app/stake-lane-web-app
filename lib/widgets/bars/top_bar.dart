import 'package:stake_lane_web_app/constants/style.dart';
import 'package:stake_lane_web_app/controllers/controllers.dart';
import 'package:stake_lane_web_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/helpers/responsiveness.dart';
import 'package:stake_lane_web_app/routing/routes.dart';

Widget topBarItem(setState, destination, icon, subtitle, widget, screenWidth) {
  Color color = dark;
  FontWeight weight = FontWeight.normal;
  double fontSize = 14.0;

  if (widget.activeButton == destination) {
    color = activeColdColor;
    weight = FontWeight.bold;
    fontSize = 16.0;
  }

  return SizedBox(
    width: screenWidth / 3,
    height: 55,
    child: MaterialButton(
      onPressed: () {
        setState(
          () => {
            if (widget.activeButton != destination)
              {
                widget.activeButton = destination,
                navigationController.navigateTo(destination),
              },
          },
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
          ),
          const SizedBox(
            width: 2,
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: CustomText(
              size: fontSize,
              color: color,
              text: subtitle,
              textAlign: TextAlign.center,
              weight: weight,
            ),
          ),
        ],
      ),
    ),
  );
}

class TopBar extends StatefulWidget {
  String activeButton = "Leagues";
  TopBar({
    super.key,
    required this.activeButton,
  });

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (ResponsiveWidget.isLargeScreen(context)) {
      return Container();
    }

    List<Widget> topBarItems = [
      topBarItem(
        setState,
        PoolsPageRoute,
        Icons.group,
        "Pools",
        widget,
        screenWidth,
      ),
      topBarItem(
        setState,
        LeaguePageRoute,
        Icons.stadium,
        "Leagues",
        widget,
        screenWidth,
      ),
      topBarItem(
        setState,
        FriendsPageRoute,
        Icons.handshake,
        "Friends",
        widget,
        screenWidth,
      ),
    ];

    return Positioned(
      top: 0,
      child: Container(
        width: screenWidth,
        height: 55,
        decoration: (BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: dark.withOpacity(.1),
              width: 2,
            ),
          ),
          color: Colors.grey[100],
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: topBarItems,
        ),
      ),
    );
  }
}
