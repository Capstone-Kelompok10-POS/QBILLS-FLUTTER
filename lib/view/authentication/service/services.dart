import 'package:flutter/material.dart';
import 'package:pos_capstone/view/authentication/model/modelAuth.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  Future<User?> login(String username, String password) async {
    const api = 'https://qbills.biz.id/api/v1/cashier/login';
    final data = {"username": username, "password": password};
    final dio = Dio();
    Response response;

    try {
      response = await dio.post(api, data: data);

      debugPrint(response.data.toString());
      // Periksa tipe data response
      if (response.data is Map<String, dynamic>) {
        final Map<String, dynamic> jsonData = response.data;
        final User user = User.fromJson(jsonData);
        return user;
      } else {
        print('Response is not a Map<String, dynamic>');
      }
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        print('Error response: ${e.response}');
        print('Error message: ${e.message}');
        if (e.response != null) {
          print('Response data: ${e.response!.data}');
        }
      } else {
        print('Unexpected error: $e');
      }
    }
    return null;
  }

  Future<void> logout() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove('token');
    notifyListeners();
  }
}
