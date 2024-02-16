import 'dart:convert';
import 'package:http/http.dart' as http;
import 'shared_service.dart';
import 'package:deliver_ease/Config/config.dart';
import 'package:deliver_ease/Models/delivery_model.dart';

class DeliveryService {
  static var client = http.Client();

  static Future<bool?> addDelivery(DeliveryDemandeRequest model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    String? token = await SharedService.getToken();
    print('Token: $token');
    requestHeaders['Authorization'] = 'Bearer $token';
  
    try {
      var response = await client.post(
        Uri.parse(APIConfig.API_URL + APIConfig.DELIVERY_URL + "/demand"),
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