import 'package:deliver_ease/Models/avi_model.dart';
import 'package:deliver_ease/Models/colie_model.dart';
import 'package:deliver_ease/Models/user_model.dart';
import 'package:deliver_ease/Models/trajet_model.dart';

class Delivery {
  Delivery({
    this.id,
    this.deliveryDate,
    this.colie,
    this.user,
    this.aviList,
    this.trajet,
  });

  int? id;
  DateTime? deliveryDate;
  Colie? colie;
  User? user;
  Trajet? trajet;
  List<Avi>? aviList;

  Delivery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deliveryDate = DateTime.parse(json['deliveryDate']) ?? null;
    colie = Colie.fromJson(json['parcel']) ?? null;
    user = User.fromJson(json['user']) ?? null;
    trajet = Trajet.fromJson(json['trip']) ?? null;
    aviList = json['aviList'] != null
        ? List<Avi>.from(json['aviList'].map((x) => Avi.fromJson(x)))
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'id': id,
      'deliveryDate': deliveryDate?.toIso8601String(),
      'parcel': colie?.toJson(),
      'user': user?.toJson(),
      'trip': trajet?.toJson(),
      'aviList': aviList?.map((x) => x.toJson()).toList(),
    };
    return data;
  }
}

class DeliveryDemandeRequest {
  DeliveryDemandeRequest({
    required this.parcel,
    required this.user,
    required this.trajet,
  });

  Colie parcel;
  User user;
  Trajet trajet;

  factory DeliveryDemandeRequest.fromJson(Map<String, dynamic> json) =>
      DeliveryDemandeRequest(
        parcel: Colie.fromJson(json['parcel']),
        user: User.fromJson(json['user']),
        trajet: Trajet.fromJson(json['trajet']),
      );

  Map<String, dynamic> toJson() => {
        'parcel': parcel.toJson(),
        'user': user.toJson(),
        'trip': trajet.toJson(),
      };
}
