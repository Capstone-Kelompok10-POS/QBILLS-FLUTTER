// To parse this JSON data, do
//
//     final pointModelMember = pointModelMemberFromJson(jsonString);

import 'dart:convert';

PointModelMember pointModelMemberFromJson(String str) =>
    PointModelMember.fromJson(json.decode(str));

String pointModelMemberToJson(PointModelMember data) =>
    json.encode(data.toJson());

class PointModelMember {
  Meta meta;
  List<Result> results;

  PointModelMember({
    required this.meta,
    required this.results,
  });

  factory PointModelMember.fromJson(Map<String, dynamic> json) =>
      PointModelMember(
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
  int point;
  int valuePoint;

  Result({
    required this.id,
    required this.point,
    required this.valuePoint,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        point: json["point"],
        valuePoint: json["valuePoint"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "point": point,
        "valuePoint": valuePoint,
      };
}
