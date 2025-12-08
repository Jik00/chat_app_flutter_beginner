import 'package:flutter/material.dart';

class UsernameColorHelper {
  // 10 distinct colors that work well in chat UIs
  static final List<Color> _colors = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.teal,
    Colors.pink,
    Colors.cyan,
    Colors.deepPurple,
    Colors.amber,
  ];

  // Get a consistent color for a username
  static Color getColor(String username) {
    // Generate a hash from the username
    int hash = 0;
    for (int i = 0; i < username.length; i++) {
      hash = username.codeUnitAt(i) + ((hash << 5) - hash);
    }

    // Use the absolute value of hash to pick a color
    final index = hash.abs() % _colors.length;
    return _colors[index];
  }
}
