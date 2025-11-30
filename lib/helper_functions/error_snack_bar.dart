import 'package:chat_app/constants.dart';
import 'package:chat_app/helper_functions/create_user_error_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    BuildContext context, FirebaseAuthException e) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        getFirebaseAuthErrorMessage(e.code),
        style: const TextStyle(
          color: kPrimaryColor,
          fontSize: 18,
        ),
      ),
      backgroundColor: kSecondaryColor,
      shape: Border.all(color: Colors.red, width: 3),
    ),
  );
}
