import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class ChatAppBarTitle extends StatelessWidget {
  const ChatAppBarTitle({super.key, required this.title, required this.img, required this.w});

  final String title, img;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: w,
        ),
        Image.asset(
          img,
          height: 40,
          width: 40,
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          title,
          style: const TextStyle(
              fontFamily: 'Pacifico', color: kSecondaryColor, fontSize: 24),
        ),
      ],
    );
  }
}
