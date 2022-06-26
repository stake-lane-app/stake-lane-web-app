import 'package:flutter/material.dart';
import 'package:stake_lane_web_app/pages/leagues/widgets/cards/predictable.dart';

class FixtureCards extends StatelessWidget {
  const FixtureCards({super.key});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;

    return Column(
      children: const [
        MatchCard(
          leagueCountry:
              "https://upload.wikimedia.org/wikipedia/en/thumb/0/05/Flag_of_Brazil.svg/640px-Flag_of_Brazil.svg.png",
          leagueName: "Brasileirão",
          isoDateStartingHour: "2020-01-28T07:10:50+00:00",
          homeTeamName: "Palmeiras",
          homeTeamLogo:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Palmeiras_logo.svg/640px-Palmeiras_logo.svg.png",
          homeTeamPrediction: 2,
          awayTeamName: "Internacional",
          awayTeamLogo:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Escudo_do_Sport_Club_Internacional.svg/1200px-Escudo_do_Sport_Club_Internacional.svg.png",
          awayTeamPrediction: 0,
          fixtureId: 1,
        ),
        MatchCard(
          fixtureId: 2,
          leagueCountry:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_Argentina.svg/2560px-Flag_of_Argentina.svg.png",
          leagueName: "Primera Division",
          isoDateStartingHour: "2020-01-29T22:30:50+00:00",
          homeTeamName: "Rosario Central",
          homeTeamLogo:
              "https://upload.wikimedia.org/wikipedia/en/thumb/c/ce/Rosario_Central_logo.svg/1200px-Rosario_Central_logo.svg.png",
          awayTeamName: "Racing Club",
          awayTeamLogo:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Escudo_de_Racing_Club_%282014%29.svg/1200px-Escudo_de_Racing_Club_%282014%29.svg.png",
        ),
        MatchCard(
          fixtureId: 3,
          leagueCountry:
              "https://upload.wikimedia.org/wikipedia/en/thumb/b/be/Flag_of_England.svg/1200px-Flag_of_England.svg.png",
          leagueName: "Premier League",
          isoDateStartingHour: "2020-02-01T17:00:50+00:00",
          homeTeamName: "Tottenham Hotspur",
          homeTeamLogo:
              "https://upload.wikimedia.org/wikipedia/pt/6/6d/Tottenham_Hotspur.png",
          awayTeamName: "Crystal Palace F.C.",
          awayTeamLogo:
              "https://upload.wikimedia.org/wikipedia/pt/c/c1/Crystal_Palace_FC_logo.png",
        ),
        MatchCard(
          fixtureId: 4,
          leagueCountry:
              "https://upload.wikimedia.org/wikipedia/en/thumb/b/be/Flag_of_England.svg/1200px-Flag_of_England.svg.png",
          leagueName: "Premier League",
          isoDateStartingHour: "2020-02-01T17:00:50+00:00",
          homeTeamName: "Tottenham Hotspur",
          homeTeamLogo:
              "https://upload.wikimedia.org/wikipedia/pt/6/6d/Tottenham_Hotspur.png",
          awayTeamName: "Crystal Palace F.C.",
          awayTeamLogo:
              "https://upload.wikimedia.org/wikipedia/pt/c/c1/Crystal_Palace_FC_logo.png",
        ),
        MatchCard(
          fixtureId: 5,
          leagueCountry:
              "https://upload.wikimedia.org/wikipedia/en/thumb/b/be/Flag_of_England.svg/1200px-Flag_of_England.svg.png",
          leagueName: "Premier League",
          isoDateStartingHour: "2020-02-01T17:00:50+00:00",
          homeTeamName: "Tottenham Hotspur",
          homeTeamLogo:
              "https://upload.wikimedia.org/wikipedia/pt/6/6d/Tottenham_Hotspur.png",
          awayTeamName: "Crystal Palace F.C.",
          awayTeamLogo:
              "https://upload.wikimedia.org/wikipedia/pt/c/c1/Crystal_Palace_FC_logo.png",
        )
      ],
    );
  }
}
