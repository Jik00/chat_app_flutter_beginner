import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.hint, this.onTap});

  final String hint;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          // side:BorderSide(color: kThirdColor, strokeAlign: BorderSide.strokeAlignCenter),
          minimumSize: const Size(402, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          hint,
          style: const TextStyle(
            fontSize: 26,
            color: kPrimaryColor,
          ),
        ));
  }
}
