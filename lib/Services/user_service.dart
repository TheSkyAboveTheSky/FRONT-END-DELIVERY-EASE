import 'dart:convert';
import 'package:http/http.dart' as http;
import 'shared_service.dart';
import 'package:deliver_ease/Models/user_model.dart';
import 'package:deliver_ease/Config/config.dart';

class UserService {
  static var client = http.Client();

  static Future<User?> getUserById(int id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    try {
      var response = await client.get(
        Uri.parse(APIConfig.API_URL + APIConfig.getAllUsersURL + '/$id'),
        headers: requestHeaders,
      );
      print('Response: ${response.body}');
      if (response.statusCode == 200) {
        print("User: ${User.fromJson(jsonDecode(response.body))}");
        return User.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print('Error in GetUserById: $e');
      return null;
    }
  }

  static Future<List<User>?> getAllUsers() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    try {
      var response = await client.get(
        Uri.parse(APIConfig.API_URL + APIConfig.getAllUsersURL),
        headers: requestHeaders,
      );
      print('Response: ${response.body}');
      if (response.statusCode == 200) {
        List<User> users = [];
        for (var user in jsonDecode(response.body)) {
          users.add(User.fromJson(user));
        }
        return users;
      } else {
        return null;
      }
    } catch (e) {
      print('Error in GetAllUsers: $e');
      return null;
    }
  }

  static Future<bool> deleteUser(int id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    try {
      var response = await client.delete(
        Uri.parse(APIConfig.API_URL + APIConfig.getAllUsersURL + '/$id'),
        headers: requestHeaders,
      );
      print('Response: ${response.body}');
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error in DeleteUser: $e');
      return false;
    }
  }
}
