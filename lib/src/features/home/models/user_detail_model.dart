import 'dart:convert';

class UserDetailModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserDetailModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory UserDetailModel.fromJson(String str) => UserDetailModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserDetailModel.fromMap(Map<String, dynamic> json) => UserDetailModel(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
