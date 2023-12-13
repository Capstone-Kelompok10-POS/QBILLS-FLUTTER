import 'package:flutter/material.dart';
import 'package:pos_capstone/models/membership_model.dart';
import 'package:dio/dio.dart';
import 'package:pos_capstone/service/membership_service.dart';

class MembershipDetails with ChangeNotifier {
  Membership? membershipModel;
  final services = ApiServiceMembership();
  String accessToken = "";
  bool isLoading = true;

  Future<void> getMembers() async {
    try {
      isLoading = true;
      notifyListeners(); // Pembaruan status loading diinisiasi
      membershipModel = await services.getMembers();
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
