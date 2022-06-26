import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/pages/pools/bottom_bar_items.dart';
import 'package:stake_lane_web_app/widgets/bars/bottom_bar.dart';
import 'package:stake_lane_web_app/widgets/custom_text.dart';

class PoolPublicPageRoute extends StatelessWidget {
  const PoolPublicPageRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const CustomText(text: "Public!"),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 0),
                scrollDirection: Axis.vertical,
                children: const [],
              ),
            ),
            BottomBar(
              activeButton: "Public",
              bottomBarItems: bottomBarItems(),
            ),
          ],
        ),
      ],
    );
  }
}
