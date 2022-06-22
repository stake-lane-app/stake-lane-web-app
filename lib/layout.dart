import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/helpers/responsiveness.dart';
import 'package:stake_lane_web_app/widgets/large_screen.dart';
import 'package:stake_lane_web_app/widgets/small_screen.dart';
import 'package:stake_lane_web_app/widgets/top_nav.dart';
import 'package:stake_lane_web_app/widgets/side_menu.dart';

class SiteLayout extends StatelessWidget {
  SiteLayout({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: false,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: ResponsiveWidget.isSmallScreen(context)
          ? const Drawer(child: SideMenu())
          : null,
      body: const ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen(),
      ),
    );
  }
}
