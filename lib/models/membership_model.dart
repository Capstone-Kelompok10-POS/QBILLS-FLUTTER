import 'dart:convert';

Membership membershipFromJson(String str) =>
    Membership.fromJson(json.decode(str));

String membershipToJson(Membership data) => json.encode(data.toJson());

class Membership {
  Meta meta;
  int total;
  List<Result> results;

  Membership({
    required this.meta,
    required this.total,
    required this.results,
  });

  factory Membership.fromJson(Map<String, dynamic> json) => Membership(
        meta: Meta.fromJson(json["meta"]),
        total: json["total"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "total": total,
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
  int cashierId;
  String name;
  String codeMember;
  int totalPoint;
  String phoneNumber;

  Result({
    required this.id,
    required this.cashierId,
    required this.name,
    required this.codeMember,
    required this.totalPoint,
    required this.phoneNumber,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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
