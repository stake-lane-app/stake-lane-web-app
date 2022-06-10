import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stake_lane_web_app/constants/style.dart';
import 'package:stake_lane_web_app/controllers/controllers.dart';
import 'custom_text.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  const SideMenuItem({super.key, required this.itemName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? menuController.onHover(itemName)
            : menuController.onHover("not hovering");
      },
      child: Obx(() => Container(
        color: menuController.isHovering(itemName) ?
        lightGrey.withOpacity(.1) : Colors.transparent,
        child: Row(children: [
          Visibility(
            visible: menuController.isHovering(itemName) ||
              menuController.isActive(itemName),
            maintainSize: true,
            maintainState: true,
            maintainAnimation: true,
            child: Container(width: 6, height: 40, color: dark)
          ),

          SizedBox(width: width/80,),
          Padding(
            padding: const EdgeInsets.all(16),
            child: menuController.returnIconFor(itemName)
          ),
          
          if(!menuController.isActive(itemName))
            Flexible(child: CustomText(text: itemName , color: menuController.isHovering(itemName) ? dark : lightGrey,))
            else
            Flexible(child: CustomText(text: itemName , color:  dark , size: 18, weight: FontWeight.bold,))
  
        ]),
      ))
    );
  }
}
