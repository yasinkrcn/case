import 'dart:convert';

class ErrorResponseModel {
  String? error;

  ErrorResponseModel({
    this.error,
  });

  factory ErrorResponseModel.fromJson(String str) => ErrorResponseModel.fromMap(json.decode(str));

  factory ErrorResponseModel.fromMap(Map<String, dynamic> json) => ErrorResponseModel(
        error: json["error"],
      );
}
