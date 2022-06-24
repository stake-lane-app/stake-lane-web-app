import 'package:stake_lane_web_app/constants/style.dart';
import 'package:stake_lane_web_app/controllers/controllers.dart';
import 'package:stake_lane_web_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/helpers/responsiveness.dart';

Widget topBarItem(setState, destination, icon, subtitle, widget) {
  Color color = dark;
  FontWeight weight = FontWeight.normal;
  double fontSize = 14.0;

  if (widget.activeButton == destination) {
    color = activeColdColor;
    weight = FontWeight.bold;
    fontSize = 16.0;
  }

  return SizedBox(
    width: 130,
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
          CustomText(
            size: fontSize,
            color: color,
            text: subtitle,
            textAlign: TextAlign.center,
            weight: weight,
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
    final width = MediaQuery.of(context).size.width;
    if (ResponsiveWidget.isLargeScreen(context)) {
      return Container();
    }

    List<Widget> topBarItems = [
      topBarItem(setState, "Pools", Icons.group, "Pools", widget),
      topBarItem(setState, "Leagues", Icons.stadium, "Leagues", widget),
      topBarItem(setState, "Friends", Icons.handshake, "Friends", widget),
    ];

    return Positioned(
      top: 0,
      child: Container(
        width: width,
        height: 55,
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
