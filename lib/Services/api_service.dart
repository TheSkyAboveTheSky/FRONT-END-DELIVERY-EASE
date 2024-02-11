import 'dart:convert';
import 'package:http/http.dart' as http;
import 'shared_service.dart';
import 'package:deliver_ease/Models/login_response_model.dart';
import 'package:deliver_ease/Models/login_request_model.dart';

class APIService {
  static var client = http.Client();
  static const String apiURL = 'http://localhost:8093/api/v1/';
  static const String loginURL = 'auth/authenticate';

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    try {
      var response = await client.post(
        Uri.parse(apiURL + loginURL),
        headers: requestHeaders,
        body: jsonEncode(model.toJson()),
      );
      print(jsonEncode(model.toJson()));
      print('Response: ${response.body}');
      if (response.statusCode == 200) {
        await SharedService.setLoginDetails(
          loginResponseJson(
            response.body,
          ),
        );

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error in login: $e');
      return false;
    }
  }
}
