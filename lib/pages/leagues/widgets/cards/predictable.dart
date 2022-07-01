import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stake_lane_web_app/constants/style.dart';
import 'package:stake_lane_web_app/widgets/custom_text.dart';
import 'package:stake_lane_web_app/api/predictions/upsert_prediction.dart';
import 'package:stake_lane_web_app/pages/leagues/widgets/cards/common.dart';

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
  currentPrediction,
  setState,
  widget,
  clubReference,
  direction,
) {
  if (currentPrediction is! int) {
    setState(
      () => {
        widget.homeTeamPrediction = 0,
        widget.awayTeamPrediction = 0,
      },
    );

    upsertPrediction(
      widget.fixtureId,
      widget.homeTeamPrediction,
      widget.awayTeamPrediction,
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

  upsertPrediction(
    widget.fixtureId,
    widget.homeTeamPrediction,
    widget.awayTeamPrediction,
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

class PredictableCard extends StatefulWidget {
  PredictableCard({
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
  State<PredictableCard> createState() => _PredictableCardState();
}

class _PredictableCardState extends State<PredictableCard> {
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final startingHour = DateTime.parse(widget.isoDateStartingHour).toLocal();
    double cardWidth = getCardWith(context);

    Widget predictableAreaContent = Column(
      children: [
        cardHeader(widget, startingHour, cardWidth),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: cardWidth * 0.05),
            club(
              widget.homeTeamLogo,
              widget.homeTeamName,
              cardWidth,
            ),
            predictingArea(widget, setState),
            club(
              widget.awayTeamLogo,
              widget.awayTeamName,
              cardWidth,
            ),
            SizedBox(width: cardWidth * 0.05),
          ],
        )
      ],
    );

    return baseCardStructure(predictableAreaContent, cardWidth);
  }
}
