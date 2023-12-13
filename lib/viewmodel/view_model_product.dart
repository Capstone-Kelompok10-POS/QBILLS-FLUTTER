import 'package:flutter/material.dart';
import 'package:pos_capstone/models/product_model.dart';
import 'package:dio/dio.dart';
import 'package:pos_capstone/service/product_service.dart';

class ProductProvider with ChangeNotifier {
  ProductModel? productModel;
  final services = ProductService();
  String accessToken = "";
  bool isLoading = true;
  int pageIndex = 1;
  List<Result> _filteredResults = [];
  bool _isSearching = false;
  bool get isSearching => _isSearching;
  List<Result> get filteredResults => _filteredResults;

  Future<void> getProducts() async {
    try {
      isLoading = true;

      productModel = await services.fetchProducts(producttypeid: pageIndex);
      isLoading = false;
    } catch (e) {
      if (e is DioException) {
        e.response!.statusCode;
      }
    }
    notifyListeners();
  }

  void setPage(int index) async {
    if (pageIndex == index) {
      pageIndex = 1;
    } else {
      pageIndex = index;
      await getProducts();
    }
    notifyListeners();
  }

  void searchProduct(String query, List<Result> allProduct) {
    if (query.isNotEmpty) {
      _filteredResults = allProduct
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
