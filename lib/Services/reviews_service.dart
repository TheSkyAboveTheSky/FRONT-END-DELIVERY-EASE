import 'dart:convert';
import 'package:http/http.dart' as http;
import 'shared_service.dart';
import 'package:deliver_ease/Config/config.dart';
import 'package:deliver_ease/Models/avi_model.dart';

class ReviewService {
  static var client = http.Client();

  static Future<bool> addReview(
      int delivery_id, String comment, int rating) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    String? token = await SharedService.getToken();
    requestHeaders['Authorization'] = 'Bearer $token';
    var model = {"starRating": rating, "comment": comment};
    try {
      var response = await client.post(
        Uri.parse(
            "${APIConfig.API_URL}${APIConfig.REVIEW_URL}/add/$delivery_id"),
        headers: requestHeaders,
        body: jsonEncode(model),
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

  static Future<List<Avi>?> getUserAvis(int id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    String? token = await SharedService.getToken();
    requestHeaders['Authorization'] = 'Bearer $token';
    try {
      var response = await client.get(
        Uri.parse(
            APIConfig.API_URL + APIConfig.USER_URL + "/getUserReviews/${id}"),
        headers: requestHeaders,
      );
      if (response.statusCode == 200) {
        List<Avi> avis = [];
        for (var avi in jsonDecode(response.body)) {
          avis.add(Avi.fromJson(avi));
        }
        return avis;
      } else {
        return null;
      }
    } catch (e) {
      print('Error in GetUserAvis: $e');
      return null;
    }
  }

}
