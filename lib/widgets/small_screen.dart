import 'package:stake_lane_web_app/helpers/local_navigator.dart';
import 'package:stake_lane_web_app/widgets/bars/top_bar.dart';
import 'package:flutter/material.dart';

class SmallScreen extends StatelessWidget {
  const SmallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: TopBar(activeButton: "Leagues"),
      ),
      Expanded(child: localNavigator()),
    ]);
  }
}
