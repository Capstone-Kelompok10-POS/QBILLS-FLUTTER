import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pos_capstone/models/paymentmethod_model.dart';
import 'package:pos_capstone/service/paymentmethod_service.dart';

class ViewModelPaymentMethod with ChangeNotifier {
  bool isLoading = true;
  PaymentMethod? paymentMethod;
  String accessToken = "";
  final services = ApiServicePaymentMethod();

  Future<void> getPaymentMethod() async {
    try {
      isLoading = true;
      notifyListeners(); // Pembaruan status loading diinisiasi
      paymentMethod = await services.getPaymentMethods();
    } catch (e) {
      if (e is DioError) {
        print('DioError: ${e.response?.statusCode}');
      }
    } finally {
      isLoading = false;
      notifyListeners(); // Pembaruan status loading selesai, termasuk jika ada kesalahan
    }
  }
}
