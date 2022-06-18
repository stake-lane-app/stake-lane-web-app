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

Widget predictingClubArea(previousPrediction) {
  return Column(
    children: [
      IconButton(
        onPressed: (() => {}),
        icon: const Icon(Icons.arrow_upward),
        color: dark,
        splashRadius: 0.1,
      ),
      CustomText(
        size: 24,
        color: dark,
        text: previousPrediction is String ? previousPrediction : "-",
      ),
      IconButton(
        onPressed: (() => {}),
        icon: const Icon(Icons.arrow_downward),
        color: dark,
        splashRadius: 0.1,
      )
    ],
  );
}

Widget predictingArea(homeTeamPrediction, awayTeamPrediction) {
  return Row(
    children: [
      predictingClubArea(homeTeamPrediction),
      const SizedBox(width: 20),
      Image.asset(
        "assets/match_card/cross.png",
        height: 30,
        width: 30,
        fit: BoxFit.contain,
        alignment: Alignment.center,
        color: dark,
      ),
      const SizedBox(width: 20),
      predictingClubArea(awayTeamPrediction),
    ],
  );
}

class PredictableMatchCard extends StatelessWidget {
  const PredictableMatchCard({
    super.key,
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

  final String leagueCountry;
  final String leagueName;

  final String isoDateStartingHour;

  final String homeTeamName;
  final String homeTeamLogo;
  final String? homeTeamPrediction;

  final String awayTeamName;
  final String awayTeamLogo;
  final String? awayTeamPrediction;

  @override
  Widget build(BuildContext context) {
    final startingHour = DateTime.parse(isoDateStartingHour);

    return Container(
      width: 450,
      height: 150,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: (BoxDecoration(
        color: Colors.white,
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
                    backgroundImage: NetworkImage(leagueCountry),
                    radius: 16,
                  ),
                  const SizedBox(width: 8),
                  CustomText(size: 14, color: dark, text: leagueName),
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
            club(homeTeamLogo, homeTeamName),
            // const SizedBox(width: 16),
            predictingArea(homeTeamPrediction, awayTeamPrediction),
            // const SizedBox(width: 16),
            club(awayTeamLogo, awayTeamName),
            const SizedBox(width: 20),
          ],
        )
      ]),
    );
  }
}
