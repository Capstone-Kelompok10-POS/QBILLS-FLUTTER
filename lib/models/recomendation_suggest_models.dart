// To parse this JSON data, do
//
//     final recomendationAi = recomendationAiFromJson(jsonString);

import 'dart:convert';

RecomendationAi recomendationAiFromJson(String str) =>
    RecomendationAi.fromJson(json.decode(str));

String recomendationAiToJson(RecomendationAi data) =>
    json.encode(data.toJson());

class RecomendationAi {
  Meta meta;
  String results;

  RecomendationAi({
    required this.meta,
    required this.results,
  });

  factory RecomendationAi.fromJson(Map<String, dynamic> json) =>
      RecomendationAi(
        meta: Meta.fromJson(json["meta"]),
        results: json["results"],
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "results": results,
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
