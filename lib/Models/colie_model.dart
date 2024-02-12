import 'package:deliver_ease/Models/address_model.dart';
import 'package:deliver_ease/Models/Enums/status.dart';
import 'package:deliver_ease/Models/user_model.dart';

class Colie {
  Colie({
    this.id,
    this.identifier,
    this.destinationAddress,
    this.shippingAddress,
    this.description,
    this.status,
    this.user,
  });

  int? id;
  String? identifier;
  Address? destinationAddress;
  Address? shippingAddress;
  String? description;
  Status? status;
  User? user;

  Colie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    identifier = json['identifier'];
    destinationAddress = Address.fromJson(json['destinationAddress']);
    shippingAddress = Address.fromJson(json['shippingAddress']);
    description = json['description'];
    status = _parseStatus(json['status']);
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'id': id,
      'identifier': identifier,
      'destinationAddress': destinationAddress?.toJson(),
      'shippingAddress': shippingAddress?.toJson(),
      'description': description,
      'status': status?.toJsonString(),
      'user': user?.toJson(),
    };
    return data;
  }

  Status? _parseStatus(String? status) {
    switch (status) {
      case 'UNCONFIRMED':
        return Status.UNCONFIRMED;
      case 'CONFIRMED':
        return Status.CONFIRMED;
      case 'IN_PROGRESS':
        return Status.IN_PROGRESS;
      case 'ACCEPTED':
        return Status.ACCEPTED;
      case 'IN_TRANSIT':
        return Status.IN_TRANSIT;
      case 'DELIVERED':
        return Status.DELIVERED;
      default:
        return null;
    }
  }
}
