import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stake_lane_web_app/constants/style.dart';
import 'package:stake_lane_web_app/routing/routes.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();

  var activeItem = LeaguePageRoute.obs;
  var hoverItem = "".obs;

  changeActiveitemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;
  isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case LeaguePageRoute:
        return _customIcon(Icons.stadium, itemName);
      case PoolPageRoute:
        return _customIcon(Icons.group, itemName);
      case FriendsPageRoute:
        return _customIcon(Icons.person_add, itemName);

      // ignore: todo
      //TODO: Add an authentication one
      default:
        return _customIcon(Icons.cruelty_free, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 22, color: dark);

    return Icon(
      icon,
      color: isHovering(itemName) ? dark : lightGrey,
    );
  }
}
