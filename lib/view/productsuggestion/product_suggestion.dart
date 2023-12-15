import 'package:flutter/material.dart';
import 'package:pos_capstone/constant/colors/colors.dart';
import 'package:pos_capstone/constant/textstyle/textstyle.dart';
import 'package:pos_capstone/viewmodel/view_model_chatbot.dart';
import 'package:provider/provider.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with QuickBills'),
        backgroundColor: ColorsCollection.PrimaryColor,
        centerTitle: true,
        elevation: 0,
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
                      // Jika pesan dari pengguna
                      if (message.isUser) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                backgroundColor: ColorsCollection.PrimaryColor,
                                child: Text(
                                  'U',
                                  style: AppTextStyles.titleStyleWhite,
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  margin: const EdgeInsets.all(8.0),
                                  padding: const EdgeInsets.all(12.0),
                                  decoration: BoxDecoration(
                                    color: ColorsCollection.unSelectedColor,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    message.text,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        // Jika pesan dari bot
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: ColorsCollection.GreyNeutral,
                                child: Text(
                                  'B',
                                  style: AppTextStyles.titleStyleWhite,
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  margin: const EdgeInsets.all(8.0),
                                  padding: const EdgeInsets.all(12.0),
                                  decoration: BoxDecoration(
                                    color: ColorsCollection.GreyNeutral02,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    message.text,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
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
                          onChanged: (message) {
                            if (message.isNotEmpty) {
                              chatbotProvider.sendMessage(message);
                            }
                          },
                          onSubmitted: (message) {
                            chatbotProvider.sendMessage(message);
                            _messageController.clear();
                            chatbotProvider.addUserResponse(message);
                          },
                          decoration: const InputDecoration(
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
              ],
            );
          },
        ),
      ),
    );
  }
}
