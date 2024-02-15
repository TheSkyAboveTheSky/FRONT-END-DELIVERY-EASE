import 'dart:convert';
import 'package:http/http.dart' as http;
import 'shared_service.dart';
import 'package:deliver_ease/Config/config.dart';
import 'package:deliver_ease/Models/avi_model.dart';

class ReviewService {
  static var client = http.Client();

  static Future<bool> addReview(int delivery_id, Avi model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    String? token = await SharedService.getToken();
    print('Token: $token');
    if (token != null) {
      requestHeaders['Authorization'] = 'Bearer $token';
    } else {
      print('Failed to retrieve JWT token.');
      return false;
    }
    try {
      var response = await client.post(
        Uri.parse("${APIConfig.API_URL}${APIConfig.reviewsURL}/add/$delivery_id"),
        headers: requestHeaders,
        body: jsonEncode(model.toJson()),
      );
      print('Response: ${response.body}');
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error in AddReview: $e');
      return false;
    }
  }
}
