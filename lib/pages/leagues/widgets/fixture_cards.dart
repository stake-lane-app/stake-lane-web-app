import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/pages/leagues/widgets/cards/predictable.dart';
import 'package:stake_lane_web_app/api/fixtures/my_fixtures.dart';
import 'package:stake_lane_web_app/widgets/custom_text.dart';

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
            int? homeTeamPrediction;
            int? awayTeamPrediction;

            if (fixture["prediction"] != null) {
              homeTeamPrediction = fixture["prediction"]["home_team"];
              awayTeamPrediction = fixture["prediction"]["away_team"];
            }

            // TODO: Solve CORS for images https://stackoverflow.com/questions/65653801/flutter-web-cant-load-network-image-from-another-domain
            // TODO: https://cloud.google.com/storage/docs/configuring-cors

            fixturesToScreen.add(
              // TODO: create based on statusCode logic to call the cards builder
              // TODO: Depending on that we're gonna call Predictable, Running, Finished, etc.
              PredictableCard(
                countryFlag: fixture["league"]["country_flag"] is String
                    ? fixture["league"]["country_flag"]
                    : '',
                leagueName: fixture["league"]["name"],
                isoDateStartingHour: fixture["starts_at_iso_date"],
                homeTeamName: fixture["home_team"]["name"],
                homeTeamLogo: fixture["home_team"]["logo"],
                awayTeamName: fixture["away_team"]["name"],
                awayTeamLogo: fixture["away_team"]["logo"],
                fixtureId: fixture["id"],
                homeTeamPrediction: homeTeamPrediction,
                awayTeamPrediction: awayTeamPrediction,
              ),
            );
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
