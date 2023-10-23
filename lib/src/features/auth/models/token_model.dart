import 'dart:convert';

class TokenModel {
  String? token;

  TokenModel({
    this.token,
  });

  factory TokenModel.fromJson(String str) => TokenModel.fromMap(json.decode(str));

  factory TokenModel.fromMap(Map<String, dynamic> json) => TokenModel(
        token: json["token"],
      );
}
