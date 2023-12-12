import 'package:dio/dio.dart';
import 'package:pos_capstone/models/product_model.dart';
import 'package:pos_capstone/utils/Api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductService {
  final Dio dio = Dio();
  Map<String, String> head = {
    "Content-Type": "application/json",
    "Accept": "application/json"
  };

  String? token;

  Future<void> setToken() async {
    SharedPreferences st = await SharedPreferences.getInstance();
    token = st.getString("access_token");
  }

  Future<ProductModel> fetchProducts({required int producttypeid}) async {
    await setToken();
    print(token);
    try {
      dio.options.headers["Authorization"] = "Bearer $token";
      final response = await dio.get(
          Url.BaseUrl + Url.ProductUrl + producttypeid.toString(),
          options: Options(headers: head));
      print(response.data);
      return ProductModel.fromJson(response.data);
    } catch (_) {
      print(_);
      rethrow;
    }
  }
}

// void main() async {
//   print(ProductService().fetchProducts(
//       token:
//           "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDIzMDk2ODAsImlhdCI6MTcwMjMwNjA4MCwiaWQiOjQzLCJyb2xlIjoiQ2FzaGllciJ9.gvEBmsG3UHEgtvcSExYsLT6D7wVi0NjvH8ZKggVWMxQ"));
// }
