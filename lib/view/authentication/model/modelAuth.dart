// ignore_for_file: file_names

class User {
  String username;
  String password;

  User({required this.username, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'] != null ? json['username'] as String : '',
      password: json['password'] != null ? json['password'] as String : '',
    );
  }
}
