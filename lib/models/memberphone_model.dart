// To parse this JSON data, do
//
//     final membershipPhoneNumber = membershipPhoneNumberFromJson(jsonString);

import 'dart:convert';

MembershipPhoneNumber membershipPhoneNumberFromJson(String str) =>
    MembershipPhoneNumber.fromJson(json.decode(str));

String membershipPhoneNumberToJson(MembershipPhoneNumber data) =>
    json.encode(data.toJson());

class MembershipPhoneNumber {
  Meta meta;
  Results results;

  MembershipPhoneNumber({
    required this.meta,
    required this.results,
  });

  factory MembershipPhoneNumber.fromJson(Map<String, dynamic> json) =>
      MembershipPhoneNumber(
        meta: Meta.fromJson(json["meta"]),
        results: Results.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "results": results.toJson(),
      };
}

class Meta {
  bool success;
  String message;

  Meta({
    required this.success,
    required this.message,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}

class Results {
  int id;
  int cashierId;
  String name;
  String codeMember;
  int totalPoint;
  String phoneNumber;

  Results({
    required this.id,
    required this.cashierId,
    required this.name,
    required this.codeMember,
    required this.totalPoint,
    required this.phoneNumber,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        id: json["id"],
        cashierId: json["cashierId"],
        name: json["name"],
        codeMember: json["codeMember"],
        totalPoint: json["totalPoint"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cashierId": cashierId,
        "name": name,
        "codeMember": codeMember,
        "totalPoint": totalPoint,
        "phoneNumber": phoneNumber,
      };
}
