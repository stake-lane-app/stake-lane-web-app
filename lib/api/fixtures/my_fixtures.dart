import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stake_lane_web_app/api/auth/sign_in.dart';

var client = http.Client();

Future<Map<dynamic, dynamic>> myFixtures() async {
  var signedData = await signIn();
  String localIpAddress = "192.168.3.32";

  DateTime now = DateTime.now();
  var timezone = now.timeZoneName;

  try {
    var response = await client.get(
      Uri.http(
        '$localIpAddress:4000',
        '/api/v1/fixtures/my',
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

    return {
      "error": true
    };
  } finally {
    // client.close();
  }
}
