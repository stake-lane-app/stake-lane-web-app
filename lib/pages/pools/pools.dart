import 'package:flutter/cupertino.dart';
import 'package:stake_lane_web_app/widgets/top_bar.dart';

class PoolsPageView extends StatelessWidget {
  const PoolsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Column(
          children: [
            TopBar(activeButton: "Pools"),
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
