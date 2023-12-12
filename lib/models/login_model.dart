class LoginModel {
  final Meta meta;
  final Results results;

  LoginModel({
    required this.meta,
    required this.results,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        meta: Meta.fromJson(json["meta"]),
        results: Results.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "results": results.toJson(),
      };
}

class Meta {
  final bool success;
  final String message;

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
  final String fullname;
  final String username;
  final String token;

  Results({
    required this.fullname,
    required this.username,
    required this.token,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        fullname: json["fullname"],
        username: json["username"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "username": username,
        "token": token,
      };
}
