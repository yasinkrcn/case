import 'dart:convert';
import 'package:case_voco/src/features/home/models/user_detail_model.dart';

class UserModel {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<UserDetailModel>? data;

  UserModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
  });

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: json["data"] == null
            ? []
            : List<UserDetailModel>.from(json["data"]!.map((x) => UserDetailModel.fromMap(x))),
      );
}
