import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/pages/leagues/widgets/cards/common.dart';

class RunningCard extends StatefulWidget {
  RunningCard({
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
  State<RunningCard> createState() => _RunningCardState();
}

class _RunningCardState extends State<RunningCard> {
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 20),
            club(
              widget.homeTeamLogo,
              widget.homeTeamName,
            ),
            // TODO: Add running infomation here!
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
