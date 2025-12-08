import 'package:chat_app/constants.dart';
import 'package:chat_app/services/get_it_service.dart';
import 'package:flutter/material.dart';
import '../services/firebase_service.dart';

class ChatTextField extends StatefulWidget {
    const ChatTextField(
      {super.key, required this.scrollControllerFun, required this.userMail});

  final Function scrollControllerFun;

  final String userMail;

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        maxLines: null,
        style: const TextStyle(color: kPrimaryColor, fontSize: 22),
        decoration: InputDecoration(
          hintText: 'Message ... ',
          hintStyle: const TextStyle(
            fontSize: 22,
            color: kPrimaryColor,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: kPrimaryColor, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: kThirdColor, width: 2)),
          suffixIcon: IconButton(
            icon: const Icon(Icons.send),
            iconSize: 32,
            color: kThirdColor,
            focusColor: kThirdColor,
            onPressed: () {
              String message = controller.text.trim();
              if (message.isNotEmpty) {
                getIt<FirebaseService>().sendMessage(message, widget.userMail.toString(), getIt<FirebaseService>().currentUser!.displayName!);
                controller.clear();

                widget.scrollControllerFun();
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
