import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static const primaryColor = Colors.blueAccent;

  static ThemeData get light => ThemeData(colorSchemeSeed: primaryColor);

  static ThemeData get dark => ThemeData(
    colorSchemeSeed: primaryColor,
    brightness: Brightness.dark,
  );
}
