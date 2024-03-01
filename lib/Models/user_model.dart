import 'dart:convert';
import 'package:deliver_ease/Models/Enums/role.dart';
import 'package:deliver_ease/Models/Enums/accountStatus.dart';

class User {
  User({this.email, this.firstName, this.lastName, this.role, this.rating});

  String? email;
  String? firstName;
  String? lastName;
  Role? role;
  double? rating;
  String? phoneNumber;
  int? id;
  AccountStatus? accountStatus;

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    role = _parseRole(json['role']);
    rating = json['rating'];
    phoneNumber = json['phoneNumber'] ?? "000";
    id = json['id'] ?? null;
    accountStatus = _parseAccountStatus(json['accountStatus']) ?? AccountStatus.ACTIVATED;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'role': role?.toJsonString(),
      'rating': rating,
      'phoneNumber': phoneNumber,
      'id': id,
      'accountStatus': accountStatus?.toJsonString()
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
  Role? role;
  int? id;
  String? token;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    id = json['idUserAuthenticated'];
    role = _parseRole(json['role']);
    token = json['token'].toString();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'id': id,
      'role': role?.toJsonString(),
      'token': token.toString(),
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
  Role? role;

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    role = _parseRole(json['role']);
    ;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'role': role?.toJsonString(),
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

Role? _parseRole(String? roleStr) {
  if (roleStr == null) {
    return null;
  }
  switch (roleStr.toUpperCase()) {
    case 'ADMIN':
      return Role.ADMIN;
    case 'SENDER':
      return Role.SENDER;
    case 'DELIVERY_PERSON':
      return Role.DELIVERY_PERSON;
    default:
      throw ArgumentError('Unknown Role: $roleStr');
  }
}

AccountStatus? _parseAccountStatus(String? accountStatusStr) {
  if (accountStatusStr == null) {
    return AccountStatus.ACTIVATED;
  }
  switch (accountStatusStr.toUpperCase()) {
    case 'ACTIVATED':
      return AccountStatus.ACTIVATED;
    case 'DEACTIVATED':
      return AccountStatus.DEACTIVATED;
    default:
      throw ArgumentError('Unknown AccountStatus: $accountStatusStr');
  }
}
