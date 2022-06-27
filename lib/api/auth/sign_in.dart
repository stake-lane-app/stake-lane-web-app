import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stake_lane_web_app/api/common.dart';

var client = http.Client();

Future<Map<String, String>?> signIn() async {
  String accessToken;
  String renewalToken;


  try {
    var response = await client.post(
      Uri.http(apiAddress, '/api/v1/session'),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        // TODO: Set this info dynamically
        "user": {
          "user_name": "romeo",
          "password": "12341234",
        }
      }),
    );
    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      // TODO: persist the tokens data on the frontend side
      accessToken = decodedResponse['data']['access_token'];
      renewalToken = decodedResponse['data']['renewal_token'];

      return {
        "accessToken": accessToken,
        "renewalToken": renewalToken,
      };
    }

    // TODO: Handle error
    return null;
  } finally {
    // TODO: understand how and when we should really close the client
    // client.close();
  }
}
