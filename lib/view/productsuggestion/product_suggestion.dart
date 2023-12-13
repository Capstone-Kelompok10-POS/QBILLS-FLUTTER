import 'package:flutter/material.dart';
import 'package:pos_capstone/viewmodel/view_model_chatbot.dart';
import 'package:provider/provider.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({Key? key}) : super(key: key);

  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _messageController = TextEditingController();

  void _sendMessage(ChatbotProvider chatbotProvider, String message) {
    chatbotProvider.sendMessage(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat with QuickBills',
          style: AppTextStyles.appBarChatbot,
        ),
        backgroundColor: ColorsCollection.PrimaryColor,
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
        create: (context) => ChatbotProvider(),
        child: Consumer<ChatbotProvider>(
          builder: (context, chatbotProvider, _) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    itemCount: chatbotProvider.messages.length,
                    itemBuilder: (context, index) {
                      final message = chatbotProvider.messages[index];

                      return Row(
                        mainAxisAlignment: message.isUser
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          if (!message.isUser)
                            CircleAvatar(
                              backgroundColor: ColorsCollection.GreyNeutral,
                              child: Text(
                                'B',
                                style: AppTextStyles.appBarChatbot,
                              ),
                            ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: message.isUser
                                    ? ColorsCollection.PrimaryColor
                                    : ColorsCollection.GreyNeutral,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Text(
                                message.text,
                                style: AppTextStyles.messageChatbot,
                              ),
                            ),
                          ),
                          if (message.isUser)
                            CircleAvatar(
                              // Ganti dengan foto profil chatbot jika ada
                              backgroundColor: ColorsCollection.PrimaryColor,
                              // Ganti dengan foto profil chatbot jika ada
                              child: Text(
                                'U',
                                style: AppTextStyles.appBarChatbot,
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Type a message...',
                            hintStyle: AppTextStyles.hintText,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.send,
                          color: chatbotProvider.isSending
                              ? ColorsCollection.PrimaryColor
                              : null,
                        ),
                        onPressed: () async {
                          _sendMessage(
                              chatbotProvider, _messageController.text);
                          _messageController.clear();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
