import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pos_capstone/models/recomendation_suggest_models.dart';
import 'package:pos_capstone/service/suggestion_service.dart';
import 'package:pos_capstone/viewmodel/chat_message.dart';

class ChatbotProvider with ChangeNotifier {
  final TextEditingController _messageController = TextEditingController();
  bool _isAdding = false;
  bool _isSending = false;
  String accestoken = '';
  bool get isSending => _isSending;
  bool get isAdding => _isAdding;
  RecomendationAi? _chatbotResponse; // Ubah tipe data ke RecomendationAi
  RecomendationAi? get chatbotResponse => _chatbotResponse;
  List<ChatMessage> _messages = [];
  List<ChatMessage> get messages => _messages;

  final ApiServiceProduct _chatbotService = ApiServiceProduct();

  void sendMessage(String message) {
    if (message.isNotEmpty) {
      _messageController.clear();
    }

    notifyListeners(); // Pemanggilan ini setelah mengirim pesan ke penyedia pesan
  }

  Future<void> addUserResponse(String userMessage) async {
    try {
      _isAdding = true;
      notifyListeners();

      // Pastikan _chatbotResponse diinisialisasi dengan instance RecomendationAi
      _chatbotResponse = await _chatbotService.addUserMessage(
        userMessage,
        _messages,
      );

      notifyListeners();
    } catch (error) {
      // ... (kode penanganan kesalahan yang sudah ada)
    } finally {
      _isAdding = false;
      notifyListeners();
    }
  }

  void _setChatbotResponse(RecomendationAi? value) {
    _chatbotResponse = value;
    notifyListeners();
  }

  void _setSending(bool value) {
    _isSending = value;
    notifyListeners();
  }
}
