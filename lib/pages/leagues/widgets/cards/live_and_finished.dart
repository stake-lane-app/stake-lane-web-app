import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/constants/style.dart';
import 'package:stake_lane_web_app/pages/leagues/widgets/cards/common.dart';
import 'package:stake_lane_web_app/widgets/custom_text.dart';
import 'package:stake_lane_web_app/constants/match_status.dart';
import 'package:percent_indicator/percent_indicator.dart';

Widget elapsedInfo(widget) {
  String elapsed = "${widget.elapsed}'";
  Color color = Colors.red;
  double barProgress = widget.elapsed / 90;
  List<Widget> columnList = [];

  LinearPercentIndicator progressBar = LinearPercentIndicator(
    width: 80,
    lineHeight: 4,
    percent: barProgress,
    progressColor: color,
  );

  if (runningStatusCode.contains(widget.statusCode)) {
    columnList.add(progressBar);
  }

  if (widget.statusCode == halfTime["code"]) {
    elapsed = halfTime["description"];
    columnList.add(progressBar);
  }

  if (finishedStatusCode.contains(widget.statusCode)) {
    elapsed = finished["description"];
    color = dark;
  }

  if (extraTimeStatusCode.contains(widget.statusCode)) {
    barProgress = widget.elapsed / 120;
  }

  CustomText elapsedText = CustomText(
    text: elapsed,
    weight: FontWeight.w700,
    color: color,
    size: 12,
  );

  columnList.insert(0, elapsedText);
  return Column(
    children: columnList,
  );
}

Widget liveInfoArea(widget) {
  return Column(
    children: [
      elapsedInfo(widget),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: "${widget.goalsHomeTeam}",
            size: 30,
            color: dark,
          ),
          const SizedBox(width: 2),
          Image.asset(
            "assets/match_card/cross.png",
            height: 15,
            width: 15,
            fit: BoxFit.contain,
            alignment: Alignment.center,
            color: dark,
          ),
          const SizedBox(width: 2),
          CustomText(
            text: "${widget.goalsAwayTeam}",
            size: 30,
            color: dark,
          )
        ],
      ),
    ],
  );
}

class LiveAndFinishedCard extends StatefulWidget {
  LiveAndFinishedCard({
    super.key,
    required this.fixtureId,
    required this.countryFlag,
    required this.leagueName,
    required this.isoDateStartingHour,
    required this.homeTeamName,
    required this.homeTeamLogo,
    required this.awayTeamName,
    required this.awayTeamLogo,
    required this.statusCode,
    required this.predicted,
    this.homeTeamPrediction,
    this.awayTeamPrediction,
    this.predictionScore,
    this.goalsHomeTeam,
    this.goalsAwayTeam,
    this.elapsed,
  });

  final int fixtureId;
  final String countryFlag;
  final String leagueName;

  final String isoDateStartingHour;

  final String homeTeamName;
  final String homeTeamLogo;
  int? homeTeamPrediction;

  final String awayTeamName;
  final String awayTeamLogo;
  int? awayTeamPrediction;

  final String statusCode;
  final bool predicted;
  int? predictionScore;
  int? goalsHomeTeam = 0;
  int? goalsAwayTeam = 0;
  int? elapsed = 0;

  @override
  State<LiveAndFinishedCard> createState() => _LiveAndFinishedCardState();
}

class _LiveAndFinishedCardState extends State<LiveAndFinishedCard> {
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final startingHour = DateTime.parse(widget.isoDateStartingHour).toLocal();

    Widget runningAreaContent = Column(
      children: [
        cardHeader(widget, startingHour),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 20),
            club(
              widget.homeTeamLogo,
              widget.homeTeamName,
            ),
            SizedBox(
              width: 80,
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  liveInfoArea(widget),
                  predictionArea(widget),
                ],
              ),
            ),
            club(
              widget.awayTeamLogo,
              widget.awayTeamName,
            ),
            const SizedBox(width: 20),
          ],
        )
      ],
    );

    return baseCardStructure(runningAreaContent);
  }
}
