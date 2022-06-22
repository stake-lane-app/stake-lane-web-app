import 'package:stake_lane_web_app/constants/style.dart';
import 'package:stake_lane_web_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/helpers/responsiveness.dart';

Widget topBarItem(icon, subtitle, active) {
  Color color = dark;
  FontWeight weight = FontWeight.normal;
  double fontSize = 16.0;

  if (active) {
    color = activeColdColor;
    weight = FontWeight.bold;
    fontSize = 18.0;
  }

  return SizedBox(
    width: 110,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: color,
        ),
        const SizedBox(
          width: 4,
        ),
        CustomText(
          size: fontSize,
          color: color,
          text: subtitle,
          textAlign: TextAlign.center,
          weight: weight,
        ),
      ],
    ),
  );
}

// TODO: Prolly is gonna be stateful
class TopBar extends StatelessWidget {
  String activeButton = "Leagues";

  TopBar({
    super.key,
    required this.activeButton,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> topBarItems = [
      topBarItem(Icons.group, "Pools", activeButton == "Pools"),
      topBarItem(Icons.stadium, "Leagues", activeButton == "Leagues"),
      topBarItem(Icons.person_add, "Friends", activeButton == "Friends"),
    ];

    final width = MediaQuery.of(context).size.width;
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: topBarItems,
        ),
      ),
    );
  }
}
