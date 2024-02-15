import 'dart:convert';
import 'package:http/http.dart' as http;
import 'shared_service.dart';
import 'package:deliver_ease/Models/user_model.dart';
import 'package:deliver_ease/Config/config.dart';
import 'package:deliver_ease/Services/trip_service.dart';
import 'package:deliver_ease/Models/trajet_model.dart';
import 'package:deliver_ease/Models/delivery_model.dart';
import 'package:deliver_ease/Models/colie_model.dart';

class DeliveryService {
  static var client = http.Client();

  static Future<bool?> addDelivery(DeliveryDemandeRequest model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    String? token = await SharedService.getToken();
    print('Token: $token');
    if (token != null) {
      requestHeaders['Authorization'] = 'Bearer $token';
    } else {
      print('Failed to retrieve JWT token.');
      return null;
    }

    try {
      var response = await client.post(
        Uri.parse(APIConfig.API_URL + APIConfig.deliveryURL + "/demand"),
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
      print('Error in AddDelivery: $e');
      return false;
    }
  }
}