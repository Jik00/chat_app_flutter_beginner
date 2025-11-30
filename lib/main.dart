import 'package:chat_app/constants.dart';
import 'package:chat_app/views/calculator_pg.dart';
import 'package:chat_app/views/chatpg.dart';
import 'package:chat_app/views/loginpg.dart';
import 'package:chat_app/views/registepg.dart';
import 'package:chat_app/services/get_it_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
      ),
      routes: {
        Loginpg.id: (context) => const Loginpg(),
        Registepg.id: (context) => const Registepg(),
        Chatpg.id: (context) => const Chatpg(),
        CalculatorPg.id: (context) => const CalculatorPg(),
      },
      initialRoute: Loginpg.id,
    );
  }
}
