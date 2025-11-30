import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';

class SimpleCalculatorBody extends StatefulWidget {
  const SimpleCalculatorBody({super.key});

  @override
  State<SimpleCalculatorBody> createState() => _SimpleCalculatorBodyState();
}

class _SimpleCalculatorBodyState extends State<SimpleCalculatorBody> {
  double? _value = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SimpleCalculator(
          value: _value!,
          hideExpression: false,
          hideSurroundingBorder: true,
          onChanged: (key, value, expression) {
            setState(() {
              _value = value;
            });
          },
          theme: CalculatorThemeData(
            displayColor: kPrimaryColor,
            displayStyle: const TextStyle(
              fontSize: 30,
              color: kSecondaryColor,
              fontWeight: FontWeight.bold,
            ),
            operatorColor: kThirdColor[600],
            commandColor: kPrimaryColor,
            numColor: kSecondaryColor,
            operatorStyle:
                const TextStyle(color: kSecondaryColor, fontSize: 26),
            commandStyle: const TextStyle(color: kSecondaryColor, fontSize: 26),
            numStyle: const TextStyle(color: kPrimaryColor, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
