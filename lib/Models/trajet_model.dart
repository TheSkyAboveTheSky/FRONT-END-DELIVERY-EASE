import 'package:deliver_ease/Models/address_model.dart';
import 'package:deliver_ease/Models/user_model.dart';

class Trajet {
  Trajet({
    this.id,
    this.departureAddress,
    this.arrivalAddress,
    this.departureDate,
    this.arrivalDate,
    this.cost,
    this.description,
    this.user,
  });

  int? id;
  Address? departureAddress;
  Address? arrivalAddress;
  DateTime? departureDate;
  DateTime? arrivalDate;
  double? cost;
  String? description;
  User? user;

  Trajet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departureAddress = Address.fromJson(json['departureAddress']);
    arrivalAddress = Address.fromJson(json['arrivalAddress']);
    departureDate = DateTime.parse(json['departureDate']);
    arrivalDate = DateTime.parse(json['arrivalDate']);
    cost = json['cost'];
    description = json['description'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'id': id,
      'departureAddress': departureAddress?.toJson(),
      'arrivalAddress': arrivalAddress?.toJson(),
      'departureDate': departureDate?.toIso8601String(),
      'arrivalDate': arrivalDate?.toIso8601String(),
      'cost': cost,
      'description': description,
      'user': user?.toJson(),
    };
    return data;
  }
}

class RechercheTrajet {
  RechercheTrajet({
    this.departureCity,
    this.arrivalCity,
  });

  City? departureCity;
  City? arrivalCity;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'departureAddress': departureCity?.toJson(),
      'arrivalAddress': arrivalCity?.toJson(),
    };
    return data;
  }
}

class City {
  City({
    this.city,
  });

  String? city;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'city': city,
    };
    return data;
  }
}
