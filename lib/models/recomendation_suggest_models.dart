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
  Results results;

  RecomendationAi({
    required this.meta,
    required this.results,
  });

  factory RecomendationAi.fromJson(Map<String, dynamic> json) =>
      RecomendationAi(
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
  String reply;

  Results({
    required this.reply,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        reply: json["reply"],
      );

  Map<String, dynamic> toJson() => {
        "reply": reply,
      };
}
