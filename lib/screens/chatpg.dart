import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/services/firebase_service.dart';
import 'package:chat_app/services/get_it_service.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_text_field.dart';
import 'package:chat_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class Chatpg extends StatefulWidget {
  const Chatpg({super.key});

  static String id = "chatpg";

  @override
  State<Chatpg> createState() => ChatpgState();
}

class ChatpgState extends State<Chatpg> {
  final scrollController = ScrollController();
  List<MessageModel> _cachedMessages = [];

  @override
  Widget build(BuildContext context) {
    final String userMail =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: const ChatAppBarTitle(),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<MessageModel>>(
              stream: getIt<FirebaseService>().messagesStream(),
              builder: (context, snapshot) {
                // Keep showing cached messages while loading new ones
                if (snapshot.hasData) {
                  _cachedMessages = snapshot.data!;
                }

                return ListView.builder(
                  reverse: true,
                  controller: scrollController,
                  itemCount: _cachedMessages.length,
                  itemBuilder: (context, index) {
                    final message = _cachedMessages[index];
                    final bool isSender = message.senderId == userMail;

                    return ChatBubble(
                      messageObject: message,
                      isSender: isSender,
                    );
                  },
                );
              },
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 140),
            child: ChatTextField(
              scrollControllerFun: scrollToBottom,
              userMail: userMail,
            ),
          ),
        ],
      ),
    );
  }

  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
