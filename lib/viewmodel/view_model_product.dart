import 'package:flutter/material.dart';
import 'package:pos_capstone/models/cart_item_model.dart';
import 'package:pos_capstone/models/product_model.dart';
import 'package:pos_capstone/service/product_service.dart';

class ProductProvider with ChangeNotifier {
  ProductModel? productModel;
  final services = ProductService();
  String accessToken = "";
  bool isLoading = true;
  int pageIndex = 1;
  int selectedIndex = 0;
  List<Result> _filteredResults = [];
  bool _isSearching = false;
  bool get isSearching => _isSearching;
  List<Result> get filteredResults => _filteredResults;
  final List<CartItem> _cartItems = [];
  List<CartItem> get cartItems => _cartItems;
  bool isLastPage = false;
  int currentPage = 0;

  Future<void> getProducts() async {
    isLoading = true;
    productModel = await services.fetchProducts(producttypeid: pageIndex);
    print(productModel!.results.length);
    print("ini controller product");
    isLoading = false;
    _isSearching = false;
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

  void addToCartItem(
      String id, String image, size, String name, String price, int amount) {
    _cartItems.add(CartItem(
        id: int.parse(id),
        name: name,
        image: image,
        nameSize: size,
        amount: amount,
        price: int.parse(price)));
    notifyListeners();
  }

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void indexPage1(BuildContext context, int index) {
    selectedIndex = index;
    Navigator.pop(context);
    notifyListeners();
  }

  void manualGuide(PageController pageController) {
    pageController.addListener(() {
      if (pageController.page == 2) {
        isLastPage = true;
      } else {
        isLastPage = false;
      }
    });
    notifyListeners();
  }

  void SliderButton(PageController pageController, value) {
    if (value.currentPage < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    }
    notifyListeners();
  }
}
