import 'package:stake_lane_web_app/constants/style.dart';
import 'package:stake_lane_web_app/controllers/controllers.dart';
import 'package:stake_lane_web_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/helpers/responsiveness.dart';

import 'package:stake_lane_web_app/pages/leagues/leagues.dart';
import 'package:stake_lane_web_app/pages/pools/pools.dart';
import 'package:stake_lane_web_app/pages/friends/friends.dart';

Widget topBarItem(setState, destination, icon, subtitle, active) {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  Color color = dark;
  FontWeight weight = FontWeight.normal;
  double fontSize = 14.0;

  if (active) {
    color = activeColdColor;
    weight = FontWeight.bold;
    fontSize = 16.0;
  }

  return SizedBox(
    width: 130,
    height: 55,
    child: MaterialButton(
      onPressed: () {
        // print(pageList);
        setState(() => {
          
          print(destination),
          print(navigatorKey),
          // navigatorKey.currentState?.pushNamed(destination)

          navigationController.navigateTo(destination)
          
      });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
          ),
          const SizedBox(
            width: 2,
          ),
          CustomText(
            size: fontSize,
            color: color,
            text: subtitle,
            textAlign: TextAlign.center,
            weight: weight,
          ),
        ],
      ),
    ),
  );
}

class SuperTopBar extends StatefulWidget {
  const SuperTopBar({
    super.key,
  });

  @override
  State<SuperTopBar> createState() => _SuperTopBarState();
}

class _SuperTopBarState extends State<SuperTopBar> {
  int pageIndex = 1;
  List<Widget> pageList = <Widget>[
    const PoolsPageView(),
    const LeaguesPageView(),
    const FriendsPageView(),
  ];

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (ResponsiveWidget.isLargeScreen(context)) {
      return Container();
    }

    List<Widget> topBarItems = [
      topBarItem(setState, "Pools", Icons.group, "Pools", false),
      topBarItem(setState, "Leagues", Icons.stadium, "Leagues", true),
      topBarItem(setState, "Friends", Icons.handshake, "Friends", false),
    ];

    return Positioned(
      top: 0,
      child: Container(
        width: width,
        height: 55,
        decoration: (BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: dark.withOpacity(.1),
              width: 1.0,
            ),
          ),
          color: Colors.grey[100],
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: topBarItems,
        ),
      ),
    );
  }
}

// class TopBar extends StatelessWidget {
//   String activeButton = "Leagues";

//   TopBar({
//     super.key,
//     required this.activeButton,
//   });

//   List<Widget> pageList = <Widget>[
//     const PoolsPageView(),
//     const LeaguesPageView(),
//     const FriendsPageView(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> topBarItems = [
//       topBarItem(context, Icons.group, "Pools", activeButton == "Pools"),
//       topBarItem(context, Icons.stadium, "Leagues", activeButton == "Leagues"),
//       topBarItem(
//           context, Icons.handshake, "Friends", activeButton == "Friends"),
//     ];

//     final width = MediaQuery.of(context).size.width;
//     if (ResponsiveWidget.isLargeScreen(context)) {
//       return Container();
//     }

//     return Positioned(
//       top: 0,
//       child: Container(
//         width: width,
//         height: 55,
//         decoration: (BoxDecoration(
//           border: Border(
//             bottom: BorderSide(
//               color: dark.withOpacity(.1),
//               width: 1.0,
//             ),
//           ),
//           color: Colors.grey[100],
//         )),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: topBarItems,
//         ),
//       ),
//     );
//   }
// }
