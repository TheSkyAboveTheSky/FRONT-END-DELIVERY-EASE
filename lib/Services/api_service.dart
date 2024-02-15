import 'dart:convert';
import 'package:deliver_ease/Models/address_model.dart';
import 'package:deliver_ease/Models/avi_model.dart';
import 'package:deliver_ease/Models/colie_model.dart';
import 'package:deliver_ease/Models/delivery_model.dart';
import 'package:deliver_ease/Services/delivery_service.dart';
import 'package:deliver_ease/Services/reviews_service.dart';
import 'package:http/http.dart' as http;
import 'shared_service.dart';
import 'package:deliver_ease/Models/user_model.dart';
import 'package:deliver_ease/Config/config.dart';
import 'package:deliver_ease/Services/trip_service.dart';
import 'package:deliver_ease/Models/trajet_model.dart';
import 'package:deliver_ease/Services/parcel_service.dart';

class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    try {
      var response = await client.post(
        Uri.parse(APIConfig.API_URL + APIConfig.loginURL),
        headers: requestHeaders,
        body: jsonEncode(model.toJson()),
      );
      if (response.statusCode == 200) {
        await SharedService.setLoginDetails(
          loginResponseJson(
            response.body,
          ),
        );
        Avi avi =
            Avi(starRating: 4, comment: 'Good', reviewDate: DateTime.now());
        await ReviewService.addReview(1, avi);
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
        Uri.parse(APIConfig.API_URL + APIConfig.loginURL),
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
