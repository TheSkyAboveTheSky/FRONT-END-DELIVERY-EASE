import 'dart:convert';

RegisterResponseModel registerResponseJson(str) =>
    RegisterResponseModel.fromJson(json.decode(str));

class RegisterResponseModel {
  RegisterResponseModel({
    this.message,
  });

  String? message;

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{
      'message': message,
    };
    return _data;
  }
}
