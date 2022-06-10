import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/widgets/horizontal_menu_item.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  const SideMenuItem({super.key, required this.itemName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return HorizontalMenuItem(itemName: itemName, onTap: onTap);
  }
}
