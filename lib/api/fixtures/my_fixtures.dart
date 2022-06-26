import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stake_lane_web_app/api/auth/sign_in.dart';

var client = http.Client();

Future<Map<dynamic, dynamic>> myFixtures() async {
  // TODO: Instead of crazily calling signIn like that, a renew section should be done
  // TODO: And the session tokens should be stored on the frontend side
  var signedData = await signIn();
  
  // TODO: Set the API address in just one place
  String localIpAddress = "192.168.1.106";

  // TODO: find a way to get user's timezone dynamically
  DateTime now = DateTime.now();
  var timezone = now.timeZoneName;

  try {
    var response = await client.get(
      Uri.http(
        '$localIpAddress:4000',
        '/api/v1/fixtures/my',
        // TODO: Create a pagination and set the page field dynamically
        {"page": '0', "page_size": '40', "tz": "America/Sao_Paulo"},
      ),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': '${signedData?["accessToken"]}'
      },
    );
    if (response.statusCode == 200) {
      return {
        "fixtures": jsonDecode(utf8.decode(response.bodyBytes)),
      };
    }

    // TODO: Handle the error better than this
    return {
      "error": true
    };
  } finally {
    // TODO: understand how and when we should really close the client
    // client.close();
  }
}
