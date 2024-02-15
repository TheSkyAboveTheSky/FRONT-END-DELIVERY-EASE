import 'dart:convert';
import 'package:http/http.dart' as http;
import 'shared_service.dart';
import 'package:deliver_ease/Models/user_model.dart';
import 'package:deliver_ease/Models/trajet_model.dart';
import 'package:deliver_ease/Config/config.dart';
import 'package:deliver_ease/Services/shared_service.dart';
import 'package:deliver_ease/Models/colie_model.dart';

class ColieService {
  static var client = http.Client();

  static Future<bool?> addColie(Colie model) async {
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
        Uri.parse(APIConfig.API_URL + APIConfig.parcelsURL + "/add"),
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
      print('Error in AddColie: $e');
      return false;
    }
  }

  static Future<List<Colie>?> getAllColie() async {
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
      var response = await client.get(
        Uri.parse(APIConfig.API_URL + APIConfig.parcelsURL + "/all"),
        headers: requestHeaders,
      );
      if (response.statusCode == 200) {
        List<Colie> colies = [];
        for (var colie in jsonDecode(response.body)) {
          colies.add(Colie.fromJson(colie));
        }
        return colies;
      } else {
        return null;
      }
    } catch (e) {
      print('Error in GetAllColies: $e');
      return null;
    }
  }

  static Future<bool?> updateColie(int id, Colie model) async {
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
      var response = await client.put(
        Uri.parse(APIConfig.API_URL + APIConfig.parcelsURL + "/update/${id}"),
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
      print('Error in UpdateColie: $e');
      return false;
    }
  }

  static Future<bool?> deleteColie(int id) async {
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
      var response = await client.delete(
        Uri.parse(APIConfig.API_URL + APIConfig.parcelsURL + "/delete/${id}"),
        headers: requestHeaders,
      );
      print('Response: ${response.body}');
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error in DeleteColie: $e');
      return false;
    }
  }
}
