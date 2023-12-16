import 'package:flutter/material.dart';
import 'package:pos_capstone/models/memberphone_model.dart';
import 'package:pos_capstone/models/membership_model.dart';
import 'package:dio/dio.dart';
import 'package:pos_capstone/service/membership_service.dart';

class MembershipProvider with ChangeNotifier {
  Membership? membershipModel;
  MembershipPhoneNumber? membershipData;
  final services = ApiServiceMembership();
  String accessToken = "";
  bool isLoading = true;
  List<Result> _filteredResults = [];
  bool _isSearching = false;
  bool get isSearching => _isSearching;
  List<Result> get filteredResults => _filteredResults;
  ApiServiceMembership _apiService = ApiServiceMembership();
  List<Results> _searchResults = [];
  List<Results> get searchResults => _searchResults;
  int _totalPoint = 0;
  int get totalPoint => _totalPoint;

  Future<void> getMembers() async {
    try {
      isLoading = true;
      notifyListeners();
      membershipModel = await services.getMembers();
      notifyListeners();
      print(membershipModel!.results.length);
      print("Ini controller model member");
    } catch (e) {
      if (e is DioError) {
        print('DioError: ${e.response?.statusCode}');
      }
    } finally {
      isLoading = false;
      _isSearching = false;
      notifyListeners();
    }
  }

  Future<void> getMembersByPhoneNumber(String phoneNumber) async {
    try {
      isLoading = true;
      notifyListeners();
      membershipData =
          await _apiService.getMembershipByPhoneNumbers(phoneNumber);
      _totalPoint = membershipData!.results.totalPoint;
    } catch (e) {
      if (e is DioError) {
        print('DioError: ${e.response?.statusCode}');
      }
    } finally {
      isLoading = false;
      _isSearching = false;
      notifyListeners();
    }
  }

  Future<void> searchMembersByPhone(String query) async {
    try {
      final results = await _apiService.searchMembersByPhone(query);
      _searchResults = results;
      // Memberitahu listener bahwa state telah berubah
      notifyListeners();
    } catch (e) {
      print('Error searching members: $e');
    }
    notifyListeners();
  }

  void searchMembers(String query, List<Result> allMembers) {
    _filteredResults.clear();
    if (query.isNotEmpty) {
      _filteredResults = allMembers
          .where((result) =>
              result.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      _isSearching = true;
      notifyListeners();
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
