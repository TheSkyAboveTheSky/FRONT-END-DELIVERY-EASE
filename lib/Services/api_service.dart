import 'dart:convert';
import 'package:http/http.dart' as http;
import 'shared_service.dart';
import 'package:deliver_ease/Models/user_model.dart';
import 'package:deliver_ease/Config/config.dart';

class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    try {
      var response = await client.post(
        Uri.parse(APIConfig.API_URL + APIConfig.LOGIN_URL),
        headers: requestHeaders,
        body: jsonEncode(model.toJson()),
      );
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

  static Future<bool> register(RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    try {
      var response = await client.post(
        Uri.parse(APIConfig.API_URL + APIConfig.REGISTER_URL),
        headers: requestHeaders,
        body: jsonEncode(model.toJson()),
      );
      print(jsonEncode(model.toJson()));
      print('Response: ${response.body}');
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error in Register: $e');
      return false;
    }
  }
}
