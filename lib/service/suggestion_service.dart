import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pos_capstone/models/recomendation_suggest_models.dart';
import 'package:pos_capstone/utils/Api.dart';
import 'package:pos_capstone/viewmodel/chat_message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServiceProduct {
  final TextEditingController messageController = TextEditingController();
  final Dio dio = Dio();
  Map<String, dynamic> head = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };
  String? token;

  ApiServiceProduct(); // Constructor

  Future<void> setToken() async {
    SharedPreferences st = await SharedPreferences.getInstance();
    token = st.getString("access_token");
  }

  Future<RecomendationAi> addUserMessage(
      String userMessage, List<ChatMessage> messages) async {
    try {
      await setToken();
      dio.options.headers['Authorization'] = 'Bearer $token';
      print(token);
      print(userMessage);
      final response = await dio.post(
        Url.BaseUrl + Url.SuggestionProductAIUrl,
        options: Options(headers: head),
        data: {
          'input': userMessage,
        },
      );

      print('Response: ${response.data}');
      final chatbotResponse = RecomendationAi.fromJson(response.data);

      print(chatbotResponse.results.reply);
      messages.add(ChatMessage(
        text: chatbotResponse.results.reply,
        isUser: false,
      ));

      return RecomendationAi.fromJson(response.data);
    } catch (error) {
      if (error is DioError) {
        if (error.response?.statusCode == 400) {
          // Kesalahan klien - periksa payload atau sintaks permintaan
          print(error);
        } else {
          // Kesalahan lain
          print('Unhandled error. Check server logs for more details.');
        }
      } else {
        // Kesalahan lain selain DioError
        print('Unhandled error: $error');
      }

      rethrow;
    }
  }
}
