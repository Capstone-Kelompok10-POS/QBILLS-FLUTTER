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

  Future<void> getProducts() async {
    try {
      isLoading = true;
      notifyListeners();
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
}
