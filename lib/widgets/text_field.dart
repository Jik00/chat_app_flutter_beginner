import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

@override
class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
    required this.hint,
    required this.onChanged,
    this.obsecure = false,
  });

  final String hint;
  final Function(String) onChanged;
  final bool obsecure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecure,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        if (hint.toLowerCase().contains('E-mail') &&
            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        if (hint.toLowerCase().contains('password') && value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      style: const TextStyle(color: kSecondaryColor, fontSize: 18),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: kSecondaryColor, fontSize: 18),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kSecondaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: kThirdColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
