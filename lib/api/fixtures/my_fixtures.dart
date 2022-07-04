import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stake_lane_web_app/api/auth/sign_in.dart';
import 'package:stake_lane_web_app/api/common.dart';

var client = http.Client();

Future<Map<dynamic, dynamic>> myFixtures(page, pageSize) async {
  // TODO: Instead of crazily calling signIn like that, a renew section should be done
  // TODO: And the session tokens should be stored on the frontend side
  var signedData = await signIn();

  DateTime now = DateTime.now();
  int timezone = now.timeZoneOffset.inHours;
  String timezoneParsed = "UTC";
  if (timezone < 0) {
    timezoneParsed = "$timezone:00";
  }
  if (timezone > 0) {
    timezoneParsed = "+$timezone:00";
  }

  try {
    var response = await client.get(
      Uri.http(
        apiAddress,
        '/api/v1/fixtures/my',
        {
          "page": "$page",
          "page_size": '$pageSize',
          "tz": timezoneParsed,
        },
      ),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': '${signedData?["accessToken"]}'
      },
    );
    if (response.statusCode == 200) {
      List rawFixtures = jsonDecode(utf8.decode(response.bodyBytes));
      return {
        "fixtures": rawFixtures,
      };
    }

    // TODO: Handle the error better than this
    return {"error": true};
  } finally {
    // TODO: understand how and when we should really close the client
    // client.close();
  }
}
