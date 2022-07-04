import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/pages/leagues/widgets/cards/predictable.dart';
import 'package:stake_lane_web_app/pages/leagues/widgets/cards/live_and_finished.dart';
import 'package:stake_lane_web_app/constants/match_status.dart';

Widget buildFixtureCard(fixture) {
  bool predicted = false;
  int? homeTeamPrediction;
  int? awayTeamPrediction;
  int? predictionScore;
  bool? predictionFinished;

  if (fixture["prediction"] != null) {
    predicted = true;
    homeTeamPrediction = fixture["prediction"]["home_team"];
    awayTeamPrediction = fixture["prediction"]["away_team"];
    predictionScore = fixture["prediction"]["score"];
    predictionFinished = fixture["prediction"]["finished"];
  }

  String countryFlag = fixture["league"]["country_flag"] is String
      ? fixture["league"]["country_flag"]
      : '';

  String leagueName = fixture["league"]["name"];
  String isoDateStartingHour = fixture["starts_at_iso_date"];
  String homeTeamName = fixture["home_team"]["name"];
  String homeTeamLogo = fixture["home_team"]["logo"];
  String awayTeamName = fixture["away_team"]["name"];
  String awayTeamLogo = fixture["away_team"]["logo"];
  int fixtureId = fixture["id"];
  String statusCode = fixture["status_code"];

  int? goalsHomeTeam = fixture["goals_home_team"];
  int? goalsAwayTeam = fixture["goals_away_team"];
  int? elapsed = fixture["elapsed"];

  /* TODO: 
    1st Solve CORS for images
    https://stackoverflow.com/questions/65653801/flutter-web-cant-load-network-image-from-another-domain
    https://cloud.google.com/storage/docs/configuring-cors

    2nd create based on statusCode logic to call the cards builder
    Depending on that we're gonna call Predictable, Running, Finished, etc.
  */

  if (allowPredictionStatusCode.contains(statusCode)) {
    return PredictableCard(
      key: ValueKey(fixtureId),
      countryFlag: countryFlag,
      leagueName: leagueName,
      isoDateStartingHour: isoDateStartingHour,
      homeTeamName: homeTeamName,
      homeTeamLogo: homeTeamLogo,
      awayTeamName: awayTeamName,
      awayTeamLogo: awayTeamLogo,
      fixtureId: fixtureId,
      homeTeamPrediction: homeTeamPrediction,
      awayTeamPrediction: awayTeamPrediction,
    );
  }

  if (runningStatusCode.contains(statusCode) ||
      finishedStatusCode.contains(statusCode)) {
    return LiveAndFinishedCard(
      key: ValueKey(fixtureId),
      countryFlag: countryFlag,
      leagueName: leagueName,
      isoDateStartingHour: isoDateStartingHour,
      homeTeamName: homeTeamName,
      homeTeamLogo: homeTeamLogo,
      awayTeamName: awayTeamName,
      awayTeamLogo: awayTeamLogo,
      fixtureId: fixtureId,
      homeTeamPrediction: homeTeamPrediction,
      awayTeamPrediction: awayTeamPrediction,
      statusCode: statusCode,
      predictionScore: predictionScore,
      goalsHomeTeam: goalsHomeTeam,
      goalsAwayTeam: goalsAwayTeam,
      elapsed: elapsed,
      predicted: predicted,
    );
  }

  if (specialEndingStatusCode.contains(statusCode)) {
    // TODO: Implement it
  }

  return Container();
}

