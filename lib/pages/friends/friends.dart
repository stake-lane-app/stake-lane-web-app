
import 'package:flutter/cupertino.dart';
import 'package:stake_lane_web_app/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:stake_lane_web_app/controllers/controllers.dart';
import 'package:stake_lane_web_app/helpers/responsiveness.dart';

class FriendsPageView extends StatelessWidget {
  const FriendsPageView({super.key});

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
            ))
      ],
    );
  }
}
