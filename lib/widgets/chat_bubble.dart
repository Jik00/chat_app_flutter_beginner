import 'package:chat_app/constants.dart';
import 'package:chat_app/helper_functions/username_colors.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(
      {super.key,
      required this.messageObject,
      required this.isSender,
      required this.username});

  final MessageModel messageObject;
  final bool isSender;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // Username
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: Text(
              username,
              style: TextStyle(
                fontSize: 13,
                color: UsernameColorHelper.getColor(username),
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic, // optional
              ),
            ),
          ),
          BubbleSpecialOne(
            text: ' ${messageObject.messageData}  ',
            isSender: isSender,
            color: (isSender == false ? kPrimaryColor : kThirdColor),
            tail: true,
            textStyle: const TextStyle(fontSize: 22, color: kSecondaryColor),
          ),
        ],
      ),
    );
  }
}
