import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stake_lane_web_app/constants/style.dart';
import 'package:stake_lane_web_app/widgets/custom_text.dart';

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

int calculatePrediction(currentPrediction, direction) {
  switch (direction) {
    case "increase":
      return currentPrediction + 1;
    case "decrease":
      if (currentPrediction != 0) {
        return currentPrediction - 1;
      }
  }
  return 0;
}

void changePrediction(
    currentPrediction, setState, widget, clubReference, direction) {
  if (currentPrediction is! int) {
    setState(
      () => {
        widget.homeTeamPrediction = 0,
        widget.awayTeamPrediction = 0,
      },
    );
    return;
  }

  currentPrediction = calculatePrediction(
    currentPrediction,
    direction,
  );
  setState(
    () => {
      if (clubReference == "home")
        {widget.homeTeamPrediction = currentPrediction}
      else
        {widget.awayTeamPrediction = currentPrediction}
    },
  );
}

Widget predictingClubArea(widget, setState, previousPrediction, clubReference) {
  var currentPrediction = previousPrediction;
  return Column(
    children: [
      IconButton(
        onPressed: (() => changePrediction(
            currentPrediction, setState, widget, clubReference, "increase")),
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
        onPressed: (() => changePrediction(
            currentPrediction, setState, widget, clubReference, "decrease")),
        icon: const Icon(Icons.arrow_downward),
        color: dark,
        // splashRadius: 0.1,
      )
    ],
  );
}

Widget predictingArea(widget, setState) {
  return Row(
    children: [
      predictingClubArea(
        widget,
        setState,
        widget.homeTeamPrediction,
        "home",
      ),
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
      predictingClubArea(
        widget,
        setState,
        widget.awayTeamPrediction,
        "away",
      ),
    ],
  );
}

class MatchCard extends StatefulWidget {
  MatchCard({
    super.key,
    required this.fixtureId,
    required this.countryFlag,
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
  final String countryFlag;
  final String leagueName;

  final String isoDateStartingHour;

  final String homeTeamName;
  final String homeTeamLogo;
  int? homeTeamPrediction;

  final String awayTeamName;
  final String awayTeamLogo;
  int? awayTeamPrediction;

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
    final startingHour = DateTime.parse(widget.isoDateStartingHour).toLocal();
    
    return Container(
      width: 450,
      height: 180,
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
                  // SvgPicture.network(
                  //   widget.countryFlag,
                  // ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.countryFlag),
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
            predictingArea(widget, setState),
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
