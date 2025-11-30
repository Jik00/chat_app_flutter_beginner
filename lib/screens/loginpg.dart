import 'package:chat_app/constants.dart';
import 'package:chat_app/helper_functions/error_snack_bar.dart';
import 'package:chat_app/screens/chatpg.dart';
import 'package:chat_app/screens/registepg.dart';
import 'package:chat_app/services/firebase_service.dart';
import 'package:chat_app/services/get_it_service.dart';
import 'package:chat_app/widgets/login_button.dart';
import 'package:chat_app/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Loginpg extends StatefulWidget {
  const Loginpg({super.key});

  static String id = "loginPg";

  @override
  State<Loginpg> createState() => _LoginpgState();
}

class _LoginpgState extends State<Loginpg> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  late String mail, pass;

  bool isLoading = false;

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
                        'Log In',
                        style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ],
                ),
                InputTextField(
                    hint: 'E-mail',
                    onChanged: (value) {
                      mail = value;
                    }),
                const SizedBox(
                  height: 14,
                ),
                InputTextField(
                  hint: 'Password',
                  onChanged: (value) {
                    pass = value;
                  },
                  obsecure: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                LoginButton(
                  hint: 'Log In',
                  onTap: signInUser,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'first time ?',
                      style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Registepg.id);
                      },
                      child: const Text(
                        ' Sign Up',
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

  Future<void> signInUser() async {
    if (!formKey.currentState!.validate()) {
      setState(() => autoValidateMode = AutovalidateMode.always);
      return;
    }

    formKey.currentState!.save();
    setState(() => isLoading = true);

    try {
      await getIt<FirebaseService>().signIn(mail, pass);

      if (mounted) {
        setState(() => isLoading = false);
      }

      Navigator.pushNamedAndRemoveUntil(context, Chatpg.id, (route) => false,
          arguments: mail);
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        setState(() => isLoading = false);
        showSnackBar(context, e);
      }
    }
  }
}
