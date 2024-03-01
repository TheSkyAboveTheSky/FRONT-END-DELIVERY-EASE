import 'dart:convert';
import 'package:deliver_ease/Models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedService {
  static final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  static Future<bool> isLoggedIn() async {
    return await _secureStorage.containsKey(key: "login_details");
  }

  static Future<LoginResponseModel?> loginDetails() async {
    String? jsonString = await _secureStorage.read(key: "login_details");
    if (jsonString != null) {
      return loginResponseJson(json.decode(jsonString));
    }
    return null;
  }

  static Future<void> setLoginDetails(LoginResponseModel loginResponse) async {
    await _secureStorage.write(
        key: "login_details", value: json.encode(loginResponse.toJson()));
  }

  static Future<void> logout(BuildContext context) async {
    await _secureStorage.delete(key: "login_details");

    Navigator.pushNamedAndRemoveUntil(
      context,
      '/login',
      (route) => false,
    );
  }

  static Future<String> getToken() async {
    String? jsonString = await _secureStorage.read(key: "login_details");
    if (jsonString != null) {
      Map<String, dynamic> data = json.decode(jsonString);
      String? token = data["token"];
      if (token != null) {
        return token;
      } else {
        return "";
      }
    }
    return "";
  }

  static Future<int> getId() async {
    String? jsonString = await _secureStorage.read(key: "login_details");
    if (jsonString != null) {
      Map<String, dynamic> data = json.decode(jsonString);
      int? id = data["id"];
      if (id != null) {
        return id;
      }
    }
    return 0;
  }

  static Future<String> getRole() async {
    String? jsonString = await _secureStorage.read(key: "login_details");
    if (jsonString != null) {
      Map<String, dynamic> data = json.decode(jsonString);
      String? role = data["role"];
      if (role != null) {
        return role;
      } else {
        return "";
      }
    }
    return "";
  }

  static Future<bool> isAdmin() async {
    String? jsonString = await _secureStorage.read(key: "login_details");
    if (jsonString != null) {
      Map<String, dynamic> data = json.decode(jsonString);
      String? role = data["role"];
      if (role != null) {
        return role == "ADMIN";
      } else {
        return false;
      }
    }
    return false;
  }

  static Future<bool> isSender() async {
    String? jsonString = await _secureStorage.read(key: "login_details");
    if (jsonString != null) {
      Map<String, dynamic> data = json.decode(jsonString);
      String? role = data["role"];
      if (role != null) {
        return role == "SENDER";
      } else {
        return false;
      }
    }
    return false;
  }

  static Future<bool> isDelivery_PERSON() async {
    String? jsonString = await _secureStorage.read(key: "login_details");
    if (jsonString != null) {
      Map<String, dynamic> data = json.decode(jsonString);
      String? role = data["role"];
      if (role != null) {
        return role == "DELIVERY_PERSON";
      } else {
        return false;
      }
    }
    return false;
  }
}
