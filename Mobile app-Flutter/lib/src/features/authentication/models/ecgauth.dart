import 'dart:convert';

Ecgauth ecgauthFromJson(String str) => Ecgauth.fromJson(json.decode(str));

String ecgauthToJson(Ecgauth data) => json.encode(data.toJson());

class Ecgauth {
  String phoneNumber;
  String result;
  String userName;

  Ecgauth({
    required this.phoneNumber,
    required this.result,
    required this.userName,
  });

  factory Ecgauth.fromJson(Map<String, dynamic> json) => Ecgauth(
        phoneNumber: json["PhoneNumber"],
        result: json["Result"],
        userName: json["UserName"],
      );

  Map<String, dynamic> toJson() => {
        "PhoneNumber": phoneNumber,
        "Result": result,
        "UserName": userName,
      };
}
