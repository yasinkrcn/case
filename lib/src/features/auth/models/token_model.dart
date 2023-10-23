import 'dart:convert';

class TokenModel {
  String? token;

  TokenModel({
    this.token,
  });

  factory TokenModel.fromJson(String str) => TokenModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TokenModel.fromMap(Map<String, dynamic> json) => TokenModel(
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
      };
}
