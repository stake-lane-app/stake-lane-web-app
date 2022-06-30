import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/widgets/custom_text.dart';

class FriendsListPageView extends StatelessWidget {
  const FriendsListPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const CustomText(text: "LIST!"),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 0),
                scrollDirection: Axis.vertical,
                children: const [],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
