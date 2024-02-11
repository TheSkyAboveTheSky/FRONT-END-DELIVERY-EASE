import 'dart:convert';

import 'package:deliver_ease/Models/login_response_model.dart';
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
    // Remove login details from secure storage
    await _secureStorage.delete(key: "login_details");
    // Navigate to login screen and clear navigation history
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/login',
      (route) => false,
    );
  }
}
