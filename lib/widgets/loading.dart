import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/constants/style.dart';

const double horseHeight = 150.0;

List<Image> runningHorse = [
  Image.asset(
    "assets/horses/loading/1st.png",
    height: horseHeight,
    color: dark,
  ),
  Image.asset(
    "assets/horses/loading/2nd.png",
    height: horseHeight,
    color: dark,
  ),
  Image.asset(
    "assets/horses/loading/3rd.png",
    height: horseHeight,
    color: dark,
  ),
  Image.asset(
    "assets/horses/loading/4th.png",
    height: horseHeight,
    color: dark,
  ),
];

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoadingState();
}

class LoadingState extends State<Loading> {
  int _pos = 0;
  late Timer _timer;
  Duration intervalBetweenChanges = const Duration(milliseconds: 100);

  @override
  void initState() {
    _timer = Timer.periodic(intervalBetweenChanges, (Timer timer) {
      setState(() {
        _pos = (_pos + 1) % runningHorse.length;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(
          height: screenHeight / 5,
        ),
        runningHorse[_pos],
      ],
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    // _timer = null;
    super.dispose();
  }
}
