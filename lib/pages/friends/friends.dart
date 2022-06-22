import 'package:flutter/cupertino.dart';
import 'package:stake_lane_web_app/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:stake_lane_web_app/controllers/controllers.dart';
import 'package:stake_lane_web_app/helpers/responsiveness.dart';
import 'package:stake_lane_web_app/widgets/top_bar.dart';

class FriendsPageView extends StatelessWidget {
  const FriendsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Column(
          children: [
            TopBar(activeButton: "Friends"),
            Expanded(
              // flex: 0,
              child: ListView(
                padding: const EdgeInsets.only(top: 0),
                scrollDirection: Axis.vertical,
                children: const [],
              ),
            ),
            // smallScreenBottomBar(context, width)
          ],
        ),
      ],
    );
  }
}
