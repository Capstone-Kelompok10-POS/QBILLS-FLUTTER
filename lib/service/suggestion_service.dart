import 'package:dio/dio.dart';
import 'package:pos_capstone/models/product_model.dart';
import 'package:pos_capstone/models/recomendation_suggest_models.dart';
import 'package:pos_capstone/utils/Api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServiceProduct {
  final Dio dio = Dio();
  Map<String, dynamic> head = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };
  late String token;

  Future<void> setToken() async {
    SharedPreferences st = await SharedPreferences.getInstance();
    token = st.getString("access_token")!;
  }

  Future<RecomendationAi> getRecomendation() async {
    try {
      await setToken();
      dio.options.headers['Authorization'] = 'Bearer $token';

      final response = await dio.get(Url.BaseUrl + Url.SuggestionProductAIUrl,
          options: Options(headers: head));

      print(response.data);
      return RecomendationAi.fromJson(response.data);
    } catch (error) {
      print('Error: $error');
      rethrow;
    }
  }
}
