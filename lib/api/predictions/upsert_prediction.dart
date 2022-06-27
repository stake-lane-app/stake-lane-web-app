import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stake_lane_web_app/api/auth/sign_in.dart';
import 'package:stake_lane_web_app/api/common.dart';

var client = http.Client();

Future<Map<dynamic, dynamic>> upsertPrediction(fixtureId, predictionHomeTeam, predictionAwayTeam) async {
  // TODO: Instead of crazily calling signIn like that, a renew section should be done
  // TODO: And the session tokens should be stored on the frontend side
  var signedData = await signIn();

  try {
    var response = await client.post(
      Uri.http(
        apiAddress,
        '/api/v1/predictions',
      ),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': '${signedData?["accessToken"]}'
      },
      body: jsonEncode({
        "fixture_id": fixtureId,
        "prediction_home_team": predictionHomeTeam,
        "prediction_away_team": predictionAwayTeam
      }),
    );

    if (response.statusCode == 204) {
      return {
        "success": true
      };
    }
    
    // TODO: Handle the error better than this
    return {"error": true};
  } finally {
    // TODO: understand how and when we should really close the client
    // client.close();
  }
}
