import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stake_lane_web_app/controllers/menu_controller.dart';
import 'package:stake_lane_web_app/layout.dart';
import 'package:get/get.dart';

void main() {
  Get.put(MenuController());
  runApp(const StakeLaneApp());
}

class StakeLaneApp extends StatelessWidget {
  const StakeLaneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Stake Lane",
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.black),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
          }),
          primaryColor: Colors.green),
      home: SiteLayout(),
    );
  }
}
