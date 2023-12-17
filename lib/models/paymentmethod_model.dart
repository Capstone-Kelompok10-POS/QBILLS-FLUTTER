// To parse this JSON data, do
//
//     final paymentMethod = paymentMethodFromJson(jsonString);

import 'dart:convert';

PaymentMethod paymentMethodFromJson(String str) =>
    PaymentMethod.fromJson(json.decode(str));

String paymentMethodToJson(PaymentMethod data) => json.encode(data.toJson());

class PaymentMethod {
  Meta meta;
  List<Result> results;

  PaymentMethod({
    required this.meta,
    required this.results,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
        meta: Meta.fromJson(json["meta"]),
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
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

class Result {
  int id;
  int paymentTypeId;
  PaymentType paymentType;
  String name;

  Result({
    required this.id,
    required this.paymentTypeId,
    required this.paymentType,
    required this.name,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        paymentTypeId: json["paymentTypeId"],
        paymentType: PaymentType.fromJson(json["paymentType"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "paymentTypeId": paymentTypeId,
        "paymentType": paymentType.toJson(),
        "name": name,
      };
}

class PaymentType {
  int id;
  String typeName;

  PaymentType({
    required this.id,
    required this.typeName,
  });

  factory PaymentType.fromJson(Map<String, dynamic> json) => PaymentType(
        id: json["id"],
        typeName: json["typeName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "typeName": typeName,
      };
}
