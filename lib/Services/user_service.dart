import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:deliver_ease/Models/user_model.dart';
import 'package:deliver_ease/Config/config.dart';
import 'shared_service.dart';

class UserService {
  static var client = http.Client();

  static Future<User?> getUserInfos() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    String? token = await SharedService.getToken();
    requestHeaders['Authorization'] = 'Bearer $token';
    try {
      var response = await client.get(
        Uri.parse(APIConfig.API_URL + APIConfig.USER_URL + '/getMyInfos'),
        headers: requestHeaders,
      );
      if (response.statusCode == 200) {
        User user = User.fromJson(jsonDecode(response.body));
        return user;
      } else {
        return User();
      }
    } catch (e) {
      print('Error in GetUserInfos: $e');
      return User();
    }
  }

  static Future<List<User>?> getAllUsers() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    String? token = await SharedService.getToken();
    requestHeaders['Authorization'] = 'Bearer $token';
    try {
      var response = await client.get(
        Uri.parse(APIConfig.API_URL + APIConfig.USER_URL + "/all"),
        headers: requestHeaders,
      );
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
    String? token = await SharedService.getToken();
    requestHeaders['Authorization'] = 'Bearer $token';
    try {
      var response = await client.delete(
        Uri.parse(APIConfig.API_URL + APIConfig.USER_URL + '/$id'),
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

  static Future<User?> updateUser(User user) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    String? token = await SharedService.getToken();
    requestHeaders['Authorization'] = 'Bearer $token';

    try {
      var body = {};
      if (user.firstName != null) {
        body['firstName'] = user.firstName;
      }

      if (user.lastName != null) {
        body['lastName'] = user.lastName;
      }

      if (user.email != null) {
        body['email'] = user.email;
      }

      if (user.phoneNumber != null) {
        body['phoneNumber'] = user.phoneNumber;
      }
      var response = await client.patch(
        Uri.parse(APIConfig.API_URL + APIConfig.USER_URL + "/updateUserInfo"),
        headers: requestHeaders,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      print('Error in UpdateUser: $e');
      return null;
    }
  }

  static Future<bool?> activerUserAccount(int id) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    String? token = await SharedService.getToken();
    requestHeaders['Authorization'] = 'Bearer $token';
    var body = {
      "accountStatus": "ACTIVATED",
    };
    try {
      var response = await client.patch(
        Uri.parse(APIConfig.API_URL +
            APIConfig.USER_URL +
            "/updateAccountStatus/$id"),
        headers: requestHeaders,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error in ActiverUserAccount: $e');
      return false;
    }
  }

  static Future<bool> deactiverUserAccount(int id) async 
  {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    String? token = await SharedService.getToken();
    requestHeaders['Authorization'] = 'Bearer $token';
    var body = {
      "accountStatus": "DEACTIVATED",
    };
    try {
      var response = await client.patch(
        Uri.parse(APIConfig.API_URL +
            APIConfig.USER_URL +
            "/updateAccountStatus/$id"),
        headers: requestHeaders,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error in DesactiverUserAccount: $e');
      return false;
    }
  }

}
