import 'dart:convert';

class User {
  User({
    this.email,
    this.firstName,
    this.lastName,
    this.role,
  });

  String? email;
  String? firstName;
  String? lastName;
  String? role;

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'role': role,
    };
    return data;
  }
}

class LoginRequestModel {
  LoginRequestModel({
    this.email,
    this.password,
  });

  late final String? email;
  late final String? password;

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}

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

class RegisterRequestModel {
  RegisterRequestModel({
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.role,
  });

  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? role;

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'role': role,
    };
    return data;
  }
}

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

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

RegisterResponseModel registerResponseJson(String str) =>
    RegisterResponseModel.fromJson(json.decode(str));
