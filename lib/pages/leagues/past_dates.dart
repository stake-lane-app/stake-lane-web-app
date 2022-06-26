import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/widgets/bars/bottom_bar.dart';
import 'package:stake_lane_web_app/pages/leagues/bottom_bar_items.dart';
import 'package:stake_lane_web_app/widgets/custom_text.dart';

class LeaguePastDatesPageView extends StatelessWidget {
  const LeaguePastDatesPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const CustomText(text: "PAST!"),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 0),
                scrollDirection: Axis.vertical,
                children: const [],
              ),
            ),
            SuperBottomBar(
              activeButton: "Past",
              superBottomBarItems: bottomBarItems(),
            ),
          ],
        ),
      ],
    );
  }
}
