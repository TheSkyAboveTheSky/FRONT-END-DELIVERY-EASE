import 'dart:convert';

LoginResponseModel loginResponseJson(str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    this.firstName,
    this.lastName,
    this.role,
    this.id,
    this.token,
  });

  String? firstName;
  String? lastName;
  String? role;
  int? id;
  String? token;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    id = json['idUserAuthenticated'];
    role = json['role'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'id': id,
      'role': role,
      'token': token,
    };
    return _data;
  }
}
