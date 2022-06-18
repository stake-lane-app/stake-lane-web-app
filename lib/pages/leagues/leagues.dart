import 'package:stake_lane_web_app/pages/leagues/widgets/cards_large_screen.dart';
import 'package:stake_lane_web_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/controllers/controllers.dart';
import 'package:stake_lane_web_app/helpers/responsiveness.dart';
import 'package:get/get.dart';

class LeaguesPageView extends StatelessWidget {
  const LeaguesPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: ResponsiveWidget.isSmallScreen(context) ? 56 : 18,
                      left: 6),
                  child: CustomText(
                    text: menuController.activeItem.value,
                    size: 18,
                    weight: FontWeight.normal,
                  ),
                )
              ],
            )),
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: const [CardsLargeScreen()],
          ),
        )
      ],
    );
  }
}
