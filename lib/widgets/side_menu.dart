import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stake_lane_web_app/constants/style.dart';
import 'package:stake_lane_web_app/controllers/controllers.dart';
import 'package:stake_lane_web_app/helpers/responsiveness.dart';
import 'package:stake_lane_web_app/routing/routes.dart';
import 'package:stake_lane_web_app/widgets/custom_text.dart';
import 'package:stake_lane_web_app/widgets/side_menu_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: light,
      child: ListView(children: [
        if (ResponsiveWidget.isSmallScreen(context))
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width / 48,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset(
                        "assets/icons/logo.png",
                        width: 28,
                      )),
                  Flexible(
                      child: CustomText(
                    text: "Stake Lane",
                    size: 20,
                    weight: FontWeight.bold,
                    color: dark,
                  )),
                  SizedBox(
                    width: width / 48,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Divider(
                color: lightGrey.withOpacity(.1),
              ),
            ],
          ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: sideMenuItems
              .map((itemName) => SideMenuItem(
                  itemName: itemName,
                  onTap: () {
                    if (!menuController.isActive(itemName)) {
                      menuController.changeActiveitemTo(itemName);
                      if (ResponsiveWidget.isSmallScreen(context)) {
                        Get.back();
                        // TODO: go to item name route
                      }
                    }
                  }))
              .toList(),
        )
      ]),
    );
  }
}
