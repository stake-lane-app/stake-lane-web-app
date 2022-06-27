import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/pages/leagues/widgets/cards/predictable.dart';
import 'package:stake_lane_web_app/api/fixtures/my_fixtures.dart';
import 'package:stake_lane_web_app/widgets/custom_text.dart';
import 'package:stake_lane_web_app/constants/match_status.dart';

Widget buildFixtureCard(fixture) {
  int? homeTeamPrediction;
  int? awayTeamPrediction;

  if (fixture["prediction"] != null) {
    homeTeamPrediction = fixture["prediction"]["home_team"];
    awayTeamPrediction = fixture["prediction"]["away_team"];
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

  /* TODO: 
    1st Solve CORS for images
    https://stackoverflow.com/questions/65653801/flutter-web-cant-load-network-image-from-another-domain
    https://cloud.google.com/storage/docs/configuring-cors

    2nd create based on statusCode logic to call the cards builder
    Depending on that we're gonna call Predictable, Running, Finished, etc.
  */

  if (allowPredictionStatusCode.contains(statusCode)) {
    return PredictableCard(
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

  if (runningStatusCode.contains(statusCode)) {
    // TODO: Implement it
  }

  if (finishedStatusCode.contains(statusCode)) {
    // TODO: Implement it
  }

  if (specialEndingStatusCode.contains(statusCode)) {
    // TODO: Implement it
  }
  
  return Container();
}

class FixtureCards extends StatelessWidget {
  int page;
  FixtureCards({
    super.key,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<dynamic, dynamic>>(
      future: myFixtures(page),
      initialData: const {"loading": true},
      builder: (BuildContext context,
          AsyncSnapshot<Map<dynamic, dynamic>> snapshot) {
        if (snapshot.hasData) {
          Map content = snapshot.data as Map;

          // TODO: Create a true Loader
          if (content["loading"] == true) {
            return const CustomText(text: "Loading");
          }

          List fixtures = content['fixtures'];
          List<Widget> fixturesToScreen = [];

          for (var fixture in fixtures) {
            fixturesToScreen.add(buildFixtureCard(fixture));
          }

          return Column(
            children: fixturesToScreen,
          );
        }
        if (snapshot.hasError) {
          // TODO: Implement error
        }

        // TODO: Create a generic error page
        return const CustomText(text: "SOME ERROR =(");
      },
    );
  }
}
