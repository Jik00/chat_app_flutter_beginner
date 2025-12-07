import 'package:chat_app/constants.dart';
import 'package:chat_app/helper_functions/error_snack_bar.dart';
import 'package:chat_app/views/chatpg.dart';
import 'package:chat_app/services/get_it_service.dart';
import 'package:chat_app/widgets/login_button.dart';
import 'package:chat_app/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../services/firebase_service.dart';

class Registepg extends StatefulWidget {
  const Registepg({super.key});

  static String id = "registepg";

  @override
  State<Registepg> createState() => _RegistepgState();
}

class _RegistepgState extends State<Registepg> {
  late String mail, pass, name;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      color: kSecondaryColor,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            autovalidateMode: autoValidateMode,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset(
                  kLogo,
                  height: 150,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 55),
                  child: Text(
                    'Scholar Chat',
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      color: kSecondaryColor,
                      fontSize: 35,
                    ),
                  ),
                ),
                const Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ],
                ),
                InputTextField(
                  hint: 'Name',
                  onChanged: (data) {
                    name = data;
                  },
                ),
                const SizedBox(
                  height: 14,
                ),
                InputTextField(
                  hint: 'E-mail',
                  onChanged: (data) {
                    mail = data;
                  },
                ),
                const SizedBox(
                  height: 14,
                ),
                InputTextField(
                  hint: 'Password',
                  onChanged: (data) {
                    pass = data;
                  },
                  obsecure: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                LoginButton(
                  hint: 'Sign Up',
                  onTap: _registerUser,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'already have an account?',
                      style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        ' Log In',
                        style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _registerUser() async {
    // if it didn't pass validation
    if (!formKey.currentState!.validate()) {
      setState(() => autoValidateMode = AutovalidateMode.always);
      return;
    }

    formKey.currentState!.save();
    setState(() => isLoading = true);

    try {
      await getIt<FirebaseService>().register(mail, pass, name);

      if (mounted) {
        setState(() => isLoading = false);
      }

      Navigator.pushNamedAndRemoveUntil(
        context,
        Chatpg.id,
        (route) => false,
        arguments: mail,
      );
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        setState(() => isLoading = false);
        showSnackBar(context, e);
      }
    }
  }
}
