import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getLightTheme() {
    return ThemeData(brightness: Brightness.light, useMaterial3: true);
  }

  static ThemeData getDarkTheme() {
    return ThemeData(brightness: Brightness.dark, useMaterial3: true);
  }
}
