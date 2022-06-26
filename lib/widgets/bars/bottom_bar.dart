import 'package:stake_lane_web_app/constants/style.dart';
import 'package:stake_lane_web_app/controllers/controllers.dart';
import 'package:stake_lane_web_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/helpers/responsiveness.dart';

Widget bottomBarItem(setState, destination, icon, subtitle, widget) {
  Color color = dark;
  FontWeight weight = FontWeight.normal;
  double fontSize = 12.0;

  if (widget.activeButton == subtitle) {
    color = activeColdColor;
    weight = FontWeight.bold;
    fontSize = 13.0;
  }

  return SizedBox(
    width: 100,
    height: 55,
    child: MaterialButton(
      onPressed: () {
        setState(
          () => {
            if (widget.activeButton != subtitle)
              {
                widget.activeButton = subtitle,
                navigationController.navigateTo(destination),
              },
          },
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
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

class BottomRawItem {
  late IconData icon;
  late String subtitle;
  late String destination;

  BottomRawItem({
    required this.subtitle,
    required this.icon,
    required this.destination,
    // List<Map<String, Object>>
  });
}

class BottomBar extends StatefulWidget {
  String activeButton = "";
  List<BottomRawItem> bottomBarItems = [];

  BottomBar({
    super.key,
    required this.activeButton,
    required this.bottomBarItems,
    // List<Map<String, Object>>
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
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

    List<Widget> bottomItems = [];

    for (var bottomBarRawItem in widget.bottomBarItems) {
      bottomItems.add(
        bottomBarItem(
          setState,
          bottomBarRawItem.destination,
          bottomBarRawItem.icon,
          bottomBarRawItem.subtitle,
          widget,
        ),
      );
    }

    return SafeArea(
      child: Positioned(
        bottom: 0,
        child: Container(
          width: width,
          height: 55,
          decoration: (BoxDecoration(
            border: Border(
              top: BorderSide(
                color: dark.withOpacity(.1),
                width: 2.0,
              ),
            ),
            color: Colors.grey[100],
          )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: bottomItems,
          ),
        ),
      ),
    );
  }
}
