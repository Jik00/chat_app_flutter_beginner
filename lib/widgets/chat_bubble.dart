import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.messageObject, required this.isSender});

  final MessageModel messageObject;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: BubbleSpecialOne(
        text: ' ${messageObject.messageData} ',
        isSender: isSender,
        color: (isSender==false? kPrimaryColor:kThirdColor),
        tail: true,
        textStyle: const TextStyle(fontSize: 22, color: kSecondaryColor),
      ),
    );
  }
}
