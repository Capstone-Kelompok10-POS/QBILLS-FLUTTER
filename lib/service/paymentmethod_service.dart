import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pos_capstone/models/paymentmethod_model.dart';
import 'package:pos_capstone/utils/Api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServicePaymentMethod {
  final Dio dio = Dio();
  Map<String, dynamic> head = {
    "Content-Type": "application/json",
    "Accept": "application/json"
  };
  String? token;

  Future<void> setToken() async {
    SharedPreferences st = await SharedPreferences.getInstance();
    token = st.getString("access_token");
  }

  Future<PaymentMethod> getPaymentMethods() async {
    try {
      await setToken();
      print(token);

      dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await dio.get(Url.BaseUrl + Url.PaymentMethod,
          options: Options(headers: head));

      print(response.data);
      return PaymentMethod.fromJson(response.data);
    } catch (_) {
      print(_);
      rethrow;
    }
  }
}
