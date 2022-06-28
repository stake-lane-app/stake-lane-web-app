import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/constants/style.dart';
import 'package:stake_lane_web_app/widgets/custom_text.dart';
import 'package:stake_lane_web_app/helpers/date.dart';

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

String formattedStartingDate(startingAt) {
  String hour;
  String formattedDateInfo;

  // TODO: Get user's preferences to set one of these variables dynamically
  String twentyFourHourPattern = 'H:mm';
  String amPmHourPattern = 'h:mma';

  switch (calculateDifference(startingAt)) {
    case today:
      hour = DateFormat(twentyFourHourPattern).format(startingAt);
      formattedDateInfo = "Today - $hour";
      break;
    case tomorrow:
      hour = DateFormat(twentyFourHourPattern).format(startingAt);
      formattedDateInfo = "Tomorrow - $hour";
      break;
    case yesterday:
      hour = DateFormat(twentyFourHourPattern).format(startingAt);
      formattedDateInfo = "Yesterday - $hour";
      break;
    default:
      formattedDateInfo = DateFormat('LLL d - $twentyFourHourPattern').format(startingAt);
  }

  return formattedDateInfo;
}

Widget cardHeader(widget, startingAt) {
  return SizedBox(
    width: 350,
    height: 40,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                text: formattedStartingDate(startingAt),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget baseCardStructure(dynamicArea) {
  return Container(
    width: 450,
    height: 180,
    margin: const EdgeInsets.only(
      bottom: 10,
      top: 8,
      left: 4,
      right: 4,
    ),
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: Colors.grey,
      ),
      // color: Colors.grey[100],
      borderRadius: BorderRadius.circular(30),
    ),
    child: dynamicArea,
  );
}

Widget predictionArea(widget) {
  // TODO: Get this info dynamically
  int bingo = 20;

  String homeTeamPrediction = "${widget.homeTeamPrediction}";
  String awayTeamPrediction = "${widget.awayTeamPrediction}";
  String predictionScore = "${widget.predictionScore}";
  Color backgroundColor = lightGrey.withOpacity(.5);
  Color textColor = Colors.white;

  if (widget.predicted == false) {
    homeTeamPrediction = "-";
    awayTeamPrediction = "-";
    predictionScore = "0";
  } else {
    if (widget.predictionScore > 0) {
      backgroundColor = Colors.green.withOpacity(.7);
    }

    if (widget.predictionScore == bingo) {
      Color goldColor = const Color.fromRGBO(229, 184, 11, 1);
      backgroundColor = goldColor;
    }
  }

  return Container(
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: backgroundColor,
        width: 1,
      ),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: homeTeamPrediction,
              size: 25,
              color: textColor,
            ),
            const SizedBox(width: 2),
            Image.asset(
              "assets/icons/logo.png",
              height: 15,
              width: 15,
              fit: BoxFit.contain,
              alignment: Alignment.center,
              color: textColor,
            ),
            const SizedBox(width: 2),
            CustomText(
              text: awayTeamPrediction,
              size: 25,
              color: textColor,
            )
          ],
        ),
        CustomText(
          text: "$predictionScore pts",
          weight: FontWeight.w700,
          color: textColor,
          size: 16,
        ),
        const SizedBox(height: 2),
      ],
    ),
  );
}
