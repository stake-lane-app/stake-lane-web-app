import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/constants/style.dart';
import 'package:stake_lane_web_app/helpers/responsiveness.dart';
import 'package:stake_lane_web_app/widgets/custom_text.dart';

Widget settings() {
  return IconButton(
      icon: Icon(
        Icons.settings,
        color: dark,
      ),
      onPressed: () {});
}

Widget bellRinging() {
  return Positioned(
    top: 7,
    right: 7,
    child: Container(
      width: 12,
      height: 12,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: active,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: light, width: 2)),
    ),
  );
}

Widget bell() {
  return Stack(
    children: [
      IconButton(
          icon: Icon(
            Icons.notifications,
            color: dark.withOpacity(.7),
          ),
          onPressed: () {}),
      bellRinging()
    ],
  );
}

Widget profilePic() {
  return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Container(
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.all(2),
        child: CircleAvatar(
          backgroundColor: light,
          child: Icon(
            Icons.person_outline,
            color: dark,
          ),
        ),
      ));
}

Widget personalArea(context) {
  return Row(
    children: [
      profilePic(),
      // --> Username
      Visibility(
        visible: !ResponsiveWidget.isSmallScreen(context),
        child: CustomText(
          text: "@luhalvesbr",
          color: lightGrey,
        ),
      ),
    ],
  );
}

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 14),
                  child: Image.asset(
                    "icons/logo.png",
                    width: 28,
                  ),
                )
              ],
            )
          : IconButton(
              icon: const Icon(Icons.menu),
              color: dark,
              onPressed: () {
                key.currentState?.openDrawer();
              }),
      elevation: 1,
      title: Row(children: [
        CustomText(text: "Stake Lane", color: dark, size: 20),
        Expanded(child: Container()),
        const SizedBox(width: 10),
        personalArea(context),
        const SizedBox(width: 10),
        Container(width: 1, height: 22, color: lightGrey),
        bell(),
        settings(),
      ]),
      iconTheme: IconThemeData(color: dark),
      backgroundColor: Colors.white,
    );
