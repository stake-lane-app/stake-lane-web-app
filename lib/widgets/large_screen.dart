import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/widgets/side_menu.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: SideMenu()),
        Expanded(
            flex: 5,
            child: Container(
              color: Colors.blue,
            )),
      ],
    );
  }
}
