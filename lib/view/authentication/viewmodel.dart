import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  static Future<Map<String, dynamic>> login(
      String username, String password) async {
    String url = 'https://reqres.in/api/login';

    try {
      var response = await http.post(
        Uri.parse(url),
        body: {'username': username, 'password': password},
      );
      print(response.body);

      if (response.statusCode == 200) {
        print(response);
        return json.decode(response.body);
      } else {
        throw Exception('Gagal melakukan login: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Terjadi kesalahan: $error');
    }
  }
}
