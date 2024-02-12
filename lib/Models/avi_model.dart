import 'package:deliver_ease/Models/delivery_model.dart';

class Avi {
  Avi({
    this.id,
    this.starRating,
    this.comment,
    this.reviewDate,
    this.delivery,
  });

  int? id;
  int? starRating;
  String? comment;
  DateTime? reviewDate;
  Delivery? delivery; 

  Avi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    starRating = json['starRating'];
    comment = json['comment'];
    reviewDate = DateTime.parse(json['reviewDate']);
    delivery = Delivery.fromJson(json['delivery']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'id': id,
      'starRating': starRating,
      'comment': comment,
      'reviewDate': reviewDate?.toIso8601String(),
      'delivery': delivery?.toJson(),
    };
    return data;
  }

}
