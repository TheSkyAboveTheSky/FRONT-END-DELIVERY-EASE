import 'dart:convert';
import 'package:http/http.dart' as http;
import 'shared_service.dart';
import 'package:deliver_ease/Config/config.dart';
import 'package:deliver_ease/Models/delivery_model.dart';
import 'package:deliver_ease/Models/demande_model.dart';

class DeliveryService {
  static var client = http.Client();

  static Future<bool?> addDelivery(DeliveryDemandeRequest model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    String? token = await SharedService.getToken();
    requestHeaders['Authorization'] = 'Bearer $token';
    String json = jsonEncode(model.toJson());
    print(json);

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

  static Future<List<Demande>?> getDemands(int id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    String? token = await SharedService.getToken();
    requestHeaders['Authorization'] = 'Bearer $token';
    try {
      var response = await client.get(
        Uri.parse(
            APIConfig.API_URL + APIConfig.DELIVERY_URL + "/demands/${id}"),
        headers: requestHeaders,
      );
      if (response.statusCode == 200) {
        List<Demande> demandes = [];
        for (var demande in jsonDecode(response.body)) {
          demandes.add(Demande.fromJson(demande));
        }
        return demandes;
      } else {
        return null;
      }
    } catch (e) {
      print('Error in GetDemands: $e');
      return null;
    }
  }

  static Future<bool?> accepterDemande(int id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    String? token = await SharedService.getToken();
    requestHeaders['Authorization'] = 'Bearer $token';
    var body = {"id": id, "action": "ACCEPTED"};
    try {
      var response = await client.patch(
        Uri.parse(APIConfig.API_URL + "deliveryPerson/action"),
        headers: requestHeaders,
        body: jsonEncode(body),
      );
      print('Response: ${response.body}');
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error in accepterDemande: $e');
      return false;
    }
  }

  static Future<bool?> refuserDemande(int id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    String? token = await SharedService.getToken();
    requestHeaders['Authorization'] = 'Bearer $token';
    var body = {"id": id, "action": "REFUSED"};
    try {
      var response = await client.patch(
        Uri.parse(APIConfig.API_URL + "deliveryPerson/action"),
        headers: requestHeaders,
        body: jsonEncode(body),
      );
      print('Response: ${response.body}');
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error in refuserDemande: $e');
      return false;
    }
  }

  static Future<bool?> delivredDemande(int id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    String? token = await SharedService.getToken();
    requestHeaders['Authorization'] = 'Bearer $token';
    var body = {"id": id, "action": "DELIVERED"};
    try {
      var response = await client.patch(
        Uri.parse(APIConfig.API_URL + "deliveryPerson/action"),
        headers: requestHeaders,
        body: jsonEncode(body),
      );
      print('Response: ${response.body}');
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error in delivredDemande: $e');
      return false;
    }
  }
  
  static Future<bool?> transitDemande(int id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    String? token = await SharedService.getToken();
    requestHeaders['Authorization'] = 'Bearer $token';
    var body = {"id": id, "action": "IN_TRANSIT"};
    try {
      var response = await client.patch(
        Uri.parse(APIConfig.API_URL + "deliveryPerson/action"),
        headers: requestHeaders,
        body: jsonEncode(body),
      );
      print('Response: ${response.body}');
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error in transitDemande: $e');
      return false;
    }
  }

  static Future<Delivery?> getDelivery(int id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    String? token = await SharedService.getToken();
    requestHeaders['Authorization'] = 'Bearer $token';
    try {
      var response = await client.get(
        Uri.parse(APIConfig.API_URL + APIConfig.DELIVERY_URL + "/${id}"),
        headers: requestHeaders,
      );
      if (response.statusCode == 200) {
        return Delivery.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print('Error in GetDelivery: $e');
      return null;
    }
  }

}
