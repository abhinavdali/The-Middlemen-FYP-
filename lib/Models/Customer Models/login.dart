// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.expiry,
    this.token,
  });

  DateTime? expiry;
  String? token;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    expiry: DateTime.parse(json["expiry"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "expiry": expiry?.toIso8601String(),
    "token": token,
  };
}
