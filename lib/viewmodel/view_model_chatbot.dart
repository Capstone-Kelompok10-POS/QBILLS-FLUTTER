import 'package:flutter/material.dart';
import 'package:pos_capstone/service/suggestion_service.dart';
import 'package:pos_capstone/view/productsuggestion/product_suggestion.dart';

class ChatbotProvider with ChangeNotifier {
  final List<ChatMessage> _messages = [];
  final TextEditingController _messageController = TextEditingController();
  bool _isLoading = false;
  bool _isSending = false;
  bool get isSending => _isSending;
  
  List<ChatMessage> get messages => _messages;
  bool get isLoading => _isLoading;

  void sendMessage(String message) {
    if (message.isNotEmpty) {
      _messages.insert(0, ChatMessage(text: message, isUser: true));
      _messageController.clear();
      _simulateBotResponse();
    }
  }

  Future<void> _simulateBotResponse() async {
    try {
      _setLoading(true);
      final apiService = ApiServiceProduct();
      final productModel = await apiService.getRecomendation();
      _sendMessage('Rekomendasi produk: ${productModel.results}');
    } catch (error) {
      _sendMessage('Maaf, terjadi kesalahan dalam mengambil data produk.');
    } finally {
      _setLoading(false);
    }
  }

  void _sendMessage(String text) {
    _messages.insert(0, ChatMessage(text: text, isUser: false));
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setSending(bool value) {
    _isSending = value;
    notifyListeners();
  }
}
