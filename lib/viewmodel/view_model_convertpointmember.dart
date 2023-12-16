import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pos_capstone/models/pointmember_model.dart';
import 'package:pos_capstone/service/membership_service.dart';

class ViewModelConvertPointMember with ChangeNotifier {
  PointModelMember? membershipPoint;
  final services = ApiServiceMembership();
  bool isLoading = true;
  List<int> _dropdownItems = [];
  List<int> get dropdownItems => _dropdownItems;

  int _selectedValue = 0;
  String accessToken = "";
  int get selectedValue => _selectedValue;

  Future<void> getConvertPointMembers() async {
    try {
      isLoading = true;
      membershipPoint = await services.getPointConvertMember();

      Set<int> uniquePoints = Set<int>.from(
        membershipPoint!.results.map<int>((result) => result.point),
      );
      _dropdownItems = uniquePoints.toList()..sort();
      print(_dropdownItems.length);
      print(_dropdownItems);
    } catch (e) {
      if (e is DioError) {
        print('DioError: ${e.response?.statusCode}');
      }
    } finally {
      isLoading = false;
    }
    notifyListeners();
  }

  void updateSelectedValue(int newValue) {
    _selectedValue = newValue;
  }
}
