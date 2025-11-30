import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class ChatAppBarTitle extends StatelessWidget {
  const ChatAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          kLogo,
          height: 40,
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          "Chat",
          style: TextStyle(
              fontFamily: 'Pacifico', color: kSecondaryColor, fontSize: 24),
        ),
      ],
    );
  }
}
