import 'package:flutter/material.dart';

class MyTheme {
  static Color accentColor = Colors.indigo;

  static setAccentColor(Color accent) {
    accentColor = accent;
  }

  static const accent = Colors.indigo;
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.white,
    primaryColor: Colors.white,
    colorScheme: const ColorScheme.light().copyWith(secondary: Colors.indigo),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black87,
    canvasColor: Colors.black87,
    colorScheme: const ColorScheme.dark().copyWith(secondary: Colors.indigo),
  );
}
