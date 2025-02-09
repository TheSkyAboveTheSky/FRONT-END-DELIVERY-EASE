import 'dart:convert';
import 'package:http/http.dart' as http;
import 'shared_service.dart';
import 'package:deliver_ease/Models/trajet_model.dart';
import 'package:deliver_ease/Config/config.dart';

class TrajetService {
  static var client = http.Client();

  static Future<List<Trajet>?> getAllTrajet() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    String? token = await SharedService.getToken();
    requestHeaders['Authorization'] = 'Bearer $token';
    try {
      var response = await client.get(
        Uri.parse(APIConfig.API_URL + APIConfig.TRIP_URL + "/all"),
        headers: requestHeaders,
      );
      if (response.statusCode == 200) {
        List<Trajet> trajets = [];
        for (var trajet in jsonDecode(response.body)) {
          trajets.add(Trajet.fromJson(trajet));
        }
        return trajets;
      } else {
        return null;
      }
    } catch (e) {
      print('Error in GetAllTrajets: $e');
      return null;
    }
  }

  static Future<List<Trajet>?> getUserAllTrajet(int id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    String? token = await SharedService.getToken();
    requestHeaders['Authorization'] = 'Bearer $token';
    try {
      var response = await client.get(
        Uri.parse(APIConfig.API_URL + APIConfig.TRIP_URL + "/all/${id}"),
        headers: requestHeaders,
      );
      if (response.statusCode == 200) {
        List<Trajet> trajets = [];
        for (var trajet in jsonDecode(response.body)) {
          trajets.add(Trajet.fromJson(trajet));
        }
        return trajets;
      } else {
        return null;
      }
    } catch (e) {
      print('Error in GetUserAllTrajets: $e');
      return null;
    }
  }

  static Future<bool?> addTrajet(Trajet model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    String? token = await SharedService.getToken();
    print('Token: $token');
    requestHeaders['Authorization'] = 'Bearer $token';

    try {
      var response = await client.post(
        Uri.parse(APIConfig.API_URL + APIConfig.TRIP_URL + "/add"),
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
      print('Error in AddTrajet: $e');
      return false;
    }
  }

  static Future<bool?> updateTrajet(int id, Trajet model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    String? token = await SharedService.getToken();
    print('Token: $token');
    requestHeaders['Authorization'] = 'Bearer $token';

    try {
      var response = await client.put(
        Uri.parse(APIConfig.API_URL + APIConfig.TRIP_URL + "/update/${id}"),
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
      print('Error in UpdateTrajet: $e');
      return false;
    }
  }

  static Future<bool?> deleteTrajet(int id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    String? token = await SharedService.getToken();
    print('Token: $token');
    requestHeaders['Authorization'] = 'Bearer $token';

    try {
      var response = await client.delete(
        Uri.parse(APIConfig.API_URL + APIConfig.TRIP_URL + "/delete/${id}"),
        headers: requestHeaders,
      );
      print('Response: ${response.body}');
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error in DeleteTrajet: $e');
      return false;
    }
  }

  static Future<List<Trajet>?> searchTrajets(RechercheTrajet model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    String? token = await SharedService.getToken();
    requestHeaders['Authorization'] = 'Bearer $token';

    try {
      var response = await client.post(
        Uri.parse(APIConfig.API_URL + APIConfig.TRIP_URL + "/searchTrips"),
        headers: requestHeaders,
        body: jsonEncode(model.toJson()),
      );
      if (response.statusCode == 200) {
        List<Trajet> trajets = [];
        for (var trajet in jsonDecode(response.body)) {
          trajets.add(Trajet.fromJson(trajet));
        }
        print('Trajets: $trajets');
        return trajets;
      } else {
        return null;
      }
    } catch (e) {
      print('Error in SearchTrajets: $e');
      return null;
    }
  }
}
