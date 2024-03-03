import 'package:deliver_ease/Models/Enums/status.dart';
import 'package:deliver_ease/Models/user_model.dart';

class Demande {
  Demande({
    this.id,
    this.description,
    this.status,
    this.user,
    this.identifier,
  });
  int? id;
  String? description;
  Status? status;
  User? user;
  String? identifier;

  Demande.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    status = _parseStatus(json['status']);
    user = User.fromJson(json['userDTO']);
    identifier = json['identifier'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'id': id,
      'description': description,
      'status': status?.toJsonString(),
      'userDTO': user?.toJson(),
      'identifier': identifier,
    };
    return data;
  }

  Status? _parseStatus(String? status) {
    switch (status) {
      case 'UNCONFIRMED':
        return Status.UNCONFIRMED;
      case 'UNSELECTED':
        return Status.UNSELECTED;
      case 'REFUSED':
        return Status.REFUSED;
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
