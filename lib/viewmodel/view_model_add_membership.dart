import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pos_capstone/models/membership_model.dart';
import 'package:pos_capstone/service/membership_service.dart';

class MembershipViewModel extends ChangeNotifier {
  Membership? membershipModel;
  final services = ApiServiceMembership();
  final ApiServiceMembership _membershipService = ApiServiceMembership();
  bool _isAdding = false;

  bool get isAdding => _isAdding;

  Future<void> addMembershipp(String name, String phone, [Future? push]) async {
    try {
      _isAdding = true;
      notifyListeners(); // Pemberitahuan bahwa proses penambahan dimulai
      await _membershipService.addMembership(name, phone);
    } catch (error) {
      // Tambahkan logika penanganan kesalahan
      if (error is DioError) {
        // Periksa jika status code 201 dan beri tindakan sesuai keberhasilan
        if (error.response?.statusCode == 201) {
          print('Membership berhasil ditambahkan');
        } else {
          print('Error: ${error.response?.statusCode}');
        }
      } else {
        print('Error: $error');
      }
    } finally {
      _isAdding = false;
      membershipModel = await services.getMembers();
    }
  }
}
