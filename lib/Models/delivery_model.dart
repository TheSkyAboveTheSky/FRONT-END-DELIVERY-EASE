import 'package:deliver_ease/Models/avi_model.dart';
import 'package:deliver_ease/Models/colie_model.dart';
import 'package:deliver_ease/Models/user_model.dart';

class Delivery {
  Delivery({
    this.id,
    this.deliveryDate,
    this.colie,
    this.user,
    this.aviList,
  });

  int? id;
  DateTime? deliveryDate;
  Colie? colie;
  User? user;
  List<Avi>? aviList;

  Delivery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deliveryDate = DateTime.parse(json['deliveryDate']);
    colie = Colie.fromJson(json['colie']);
    user = User.fromJson(json['user']);
    aviList = json['aviList'] != null
        ? List<Avi>.from(json['aviList'].map((x) => Avi.fromJson(x)))
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'id': id,
      'deliveryDate': deliveryDate?.toIso8601String(),
      'colie': colie?.toJson(),
      'user': user?.toJson(),
      'aviList': aviList?.map((x) => x.toJson()).toList(),
    };
    return data;
  }

}
class DeliveryDemandeRequest {
  DeliveryDemandeRequest({
    required this.parcel,
    required this.user,
  });

  Colie parcel;
  User user;

  factory DeliveryDemandeRequest.fromJson(Map<String, dynamic> json) =>
      DeliveryDemandeRequest(
        parcel: Colie.fromJson(json['parcel']),
        user: User.fromJson(json['user']),
      );

  Map<String, dynamic> toJson() => {
        'parcel': parcel.toJson(),
        'user': user.toJson(),
      };
}
