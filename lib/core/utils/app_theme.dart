import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData orangeTheme = ThemeData(
    primaryColor: Colors.orange,
    cardColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.orange,
    ),
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),

  );
}