import 'package:stake_lane_web_app/constants/style.dart';
import 'package:stake_lane_web_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/helpers/responsiveness.dart';

Widget bottomBarItem(icon, subtitle) {
  return SizedBox(
    width: 130,
    height: 55,
    child: MaterialButton(
      onPressed: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: dark,
          ),
          CustomText(
            size: 14,
            color: dark,
            text: subtitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

// TODO: Prolly is gonna be stateful
class BottomBar extends StatelessWidget {
  String? activeButton = "";
  List<Widget> bottomBarItems = [];

  BottomBar({super.key, this.activeButton, required this.bottomBarItems});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (ResponsiveWidget.isLargeScreen(context)) {
      return Container();
    }

    return Positioned(
      bottom: 0,
      child: Container(
        width: width,
        height: 55,
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
          children: bottomBarItems,
        ),
      ),
    );
  }
}
