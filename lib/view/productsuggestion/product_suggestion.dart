import 'package:flutter/material.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/viewmodel/view_model_chatbot.dart';
import 'package:provider/provider.dart';

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
        title: Text('Chat with QuickBills'),
        backgroundColor: ColorsCollection.PrimaryColor,
        centerTitle: true,
      ),
      body: ChangeNotifierProvider.value(
        value: ChatbotProvider(),
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
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: message.isUser
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            if (!message.isUser)
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                child: Text('B'),
                              ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.all(8.0),
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: message.isUser
                                      ? ColorsCollection.PrimaryColor
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  message.text,
                                ),
                              ),
                            ),
                            if (message.isUser)
                              CircleAvatar(
                                backgroundColor: ColorsCollection.PrimaryColor,
                                child: Text('U'),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 8, left: 20, right: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          onSubmitted: (message) {
                            chatbotProvider.sendMessage(message);
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Type a message...',
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
                          final userMessage = _messageController.text;
                          chatbotProvider.sendMessage(userMessage);
                          _messageController.clear();

                          // Tambahkan pesan dari user ke daftar pesan
                          chatbotProvider.addUserResponse(userMessage);
                        },
                      ),
                    ],
                  ),
                ),
                // Menampilkan hasil respons dari chatbot
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text(
                //     chatbotProvider.chatbotResponse.toString(),
                //     style: TextStyle(fontSize: 16),
                //   ),
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}
