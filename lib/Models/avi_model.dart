import 'package:deliver_ease/Models/delivery_model.dart';
import 'package:deliver_ease/Models/user_model.dart';

class Avi {
  Avi({
    this.id,
    this.starRating,
    this.comment,
    this.reviewDate,
    this.user,
  });

  int? id;
  int? starRating;
  String? comment;
  DateTime? reviewDate;
  User? user;

  Avi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    starRating =5;
    comment = json['comment'];
    reviewDate = DateTime.parse(json['reviewDate']);
    user = User.fromJson(json['user']) ?? User();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'id': id,
      'starRating': starRating,
      'comment': comment,
      'reviewDate': reviewDate?.toIso8601String(),
      'user': user?.toJson(),
    };
    return data;
  }

}
