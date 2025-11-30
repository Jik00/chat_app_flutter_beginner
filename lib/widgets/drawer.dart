import 'package:chat_app/constants.dart';
import 'package:chat_app/views/calculator_pg.dart';
import 'package:chat_app/views/chatpg.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kPrimaryColor,
      child: Column(
        children: [
          const DrawerHeader(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                kAspects,
                style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: 24,
                    fontFamily: 'Pacifico'),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.chat,
              color: kSecondaryColor,
            ),
            title: const Text(
              kChat,
              style: TextStyle(color: kSecondaryColor, fontSize: 20),
            ),
            onTap: () {
              if (ModalRoute.of(context)?.settings.name != Chatpg.id) {
                Navigator.pushNamed(context, Chatpg.id);
              } else {
                Navigator.pop(context);
              }
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.calculate,
              color: kSecondaryColor,
            ),
            title: const Text(
              kCalculator,
              style: TextStyle(color: kSecondaryColor, fontSize: 20),
            ),
            onTap: () {
              if (ModalRoute.of(context)?.settings.name != CalculatorPg.id) {
                Navigator.pushNamed(context, CalculatorPg.id);
              } else {
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
