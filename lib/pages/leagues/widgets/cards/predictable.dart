import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stake_lane_web_app/constants/style.dart';
import 'package:stake_lane_web_app/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:stake_lane_web_app/controllers/counterController.dart';

Widget club(logo, name) {
  return SizedBox(
    width: 95,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.network(
          logo,
          height: 60,
          width: 60,
          fit: BoxFit.contain,
          alignment: Alignment.center,
        ),
        CustomText(
          size: 14,
          color: dark,
          text: name,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

int changePrediction(currentPrediction, direction) {
  switch (direction) {
    case "increase":
      return 0;
    case "decrease":
      return 0;
  }
  return 0;
}

Widget predictingClubArea(fixtureId, previousPrediction) {
  var currentPrediction = previousPrediction;
  return Column(
    children: [
      IconButton(
        onPressed: (() => {
              currentPrediction = changePrediction(
                currentPrediction is int ? currentPrediction : -1,
                "increase",
              )
            }),
        icon: const Icon(Icons.arrow_upward),
        color: dark,
        // splashRadius: 1,
      ),
      CustomText(
        size: 24,
        color: dark,
        text: currentPrediction is int ? "$currentPrediction" : "-",
      ),
      IconButton(
        onPressed: (() => {
              currentPrediction = changePrediction(
                currentPrediction is int ? currentPrediction : 0,
                "decrease",
              )
            }),
        icon: const Icon(Icons.arrow_downward),
        color: dark,
        // splashRadius: 0.1,
      )
    ],
  );
}

Widget predictingArea(fixtureId, homeTeamPrediction, awayTeamPrediction) {
  return Row(
    children: [
      predictingClubArea(fixtureId, homeTeamPrediction),
      const SizedBox(width: 10),
      Image.asset(
        "assets/match_card/cross.png",
        height: 30,
        width: 30,
        fit: BoxFit.contain,
        alignment: Alignment.center,
        color: dark,
      ),
      const SizedBox(width: 10),
      predictingClubArea(fixtureId, awayTeamPrediction),
    ],
  );
}

class MatchCard extends StatefulWidget {
  const MatchCard({
    super.key,
    required this.fixtureId,
    required this.leagueCountry,
    required this.leagueName,
    required this.isoDateStartingHour,
    required this.homeTeamName,
    required this.homeTeamLogo,
    required this.awayTeamName,
    required this.awayTeamLogo,
    this.homeTeamPrediction,
    this.awayTeamPrediction,
  });

  final int fixtureId;
  final String leagueCountry;
  final String leagueName;

  final String isoDateStartingHour;

  final String homeTeamName;
  final String homeTeamLogo;
  final int? homeTeamPrediction;

  final String awayTeamName;
  final String awayTeamLogo;
  final int? awayTeamPrediction;

  @override
  State<MatchCard> createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final startingHour = DateTime.parse(widget.isoDateStartingHour);

    return Container(
      width: 450,
      height: 170,
      margin: const EdgeInsets.only(
        bottom: 10,
        top: 8,
        left: 4,
        right: 4,
      ),
      decoration: (BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
        // color: Colors.grey[100],
        borderRadius: BorderRadius.circular(30),
      )),
      child: Column(children: [
        SizedBox(
          width: 300,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.leagueCountry),
                    radius: 16,
                  ),
                  const SizedBox(width: 8),
                  CustomText(size: 14, color: dark, text: widget.leagueName),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    CustomText(
                      size: 14,
                      color: dark,
                      text:
                          "${DateFormat.LLL().format(startingHour)} ${DateFormat.d().format(startingHour)} - ${DateFormat.Hm().format(startingHour)}",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 20),
            club(
              widget.homeTeamLogo,
              widget.homeTeamName,
            ),
            predictingArea(
              widget.fixtureId,
              widget.homeTeamPrediction,
              widget.awayTeamPrediction,
            ),
            club(
              widget.awayTeamLogo,
              widget.awayTeamName,
            ),
            const SizedBox(width: 20),
          ],
        )
      ]),
    );
  }
}
