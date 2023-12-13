import 'package:flutter/material.dart';
import 'package:pos_capstone/models/membership_model.dart';
import 'package:dio/dio.dart';
import 'package:pos_capstone/service/membership_service.dart';

class MembershipProvider with ChangeNotifier {
  Membership? membershipModel;
  final services = ApiServiceMembership();
  String accessToken = "";
  bool isLoading = true;
  List<Result> _filteredResults = [];
  bool _isSearching = false;
  bool get isSearching => _isSearching;
  List<Result> get filteredResults => _filteredResults;

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

  void searchMembers(String query, List<Result> allMembers) {
    if (query.isNotEmpty) {
      _filteredResults = allMembers
          .where((result) =>
              result.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      _isSearching = true;
    } else {
      _filteredResults.clear();
      _isSearching = false;
    }

    notifyListeners();
  }

  void clearSearch() {
    _filteredResults.clear();
    _isSearching = false;
    notifyListeners();
  }
}
