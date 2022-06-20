import 'package:stake_lane_web_app/constants/style.dart';
import 'package:stake_lane_web_app/pages/leagues/widgets/cards_large_screen.dart';
import 'package:stake_lane_web_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/helpers/responsiveness.dart';

Widget smallScreenBottomBar(context, width) {
  if (ResponsiveWidget.isLargeScreen(context)) {
    return Container();
  }

  return Positioned(
    bottom: 0,
    left: 0,
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
          Column(
            children: [
              IconButton(
                splashRadius: 0.01,
                icon: Icon(
                  Icons.add,
                  color: dark,
                ),
                onPressed: () {},
              ),
              CustomText(
                size: 12,
                color: dark,
                text: "Add a League",
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                splashRadius: 0.01,
                icon: Icon(
                  Icons.filter_alt,
                  color: dark,
                ),
                onPressed: () {},
              ),
              CustomText(
                size: 12,
                color: dark,
                text: "Filter",
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                splashRadius: 0.01,
                icon: Icon(
                  Icons.view_timeline_outlined,
                  color: dark,
                ),
                onPressed: () {},
              ),
              CustomText(
                size: 12,
                color: dark,
                text: "Past Fixtures",
                textAlign: TextAlign.center,
              ),
            ],
          ),
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
            Expanded(
              child: ListView(
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
