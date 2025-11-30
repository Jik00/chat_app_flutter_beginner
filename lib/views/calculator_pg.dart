import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/build_app_bar.dart';
import 'package:chat_app/widgets/drawer.dart';
import 'package:chat_app/widgets/simple_calculator_body.dart';
import 'package:flutter/material.dart';

class CalculatorPg extends StatelessWidget {
  const CalculatorPg({super.key});

  static String id = 'CalculatorPg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(img: kCalculatorImage, title: kCalculator, w: 45),
      drawer: const CustomDrawer(),
      body: const SimpleCalculatorBody(),
      
    );
  }
}
