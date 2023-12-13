// ignore_for_file: camel_case_types

import 'package:dio/dio.dart';
import 'package:pos_capstone/models/login_model.dart';
import 'package:pos_capstone/utils/Api.dart';

class loginService {
  final Dio dio = Dio();

  Future<LoginModel?> loginAccount(String username, String password) async {
    try {
      final response = await dio.post(Url.BaseUrl + Url.LoginUrl, data: {
        'username': username,
        'password': password,
      });
      print("=>${response.data}");
      final Map<String, dynamic> jsonData = response.data;
      final LoginModel loginModel = LoginModel.fromJson(jsonData);
      return loginModel;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
