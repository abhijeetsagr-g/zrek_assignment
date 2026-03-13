import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData lightMode = ThemeData(
    brightness: Brightness.light,

    scaffoldBackgroundColor: Colors.white,

    colorScheme: const ColorScheme.light(
      primary: Color(0xFF0095F6), // Instagram blue
      secondary: Color(0xFF0095F6),
      surface: Colors.white,
      onPrimary: Colors.white,
      onSurface: Colors.black,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),

    dividerColor: const Color(0xFFDBDBDB),

    iconTheme: const IconThemeData(color: Colors.black, size: 26),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontSize: 14),
      bodyMedium: TextStyle(color: Colors.black, fontSize: 13),
      labelLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
    ),

    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFFAFAFA),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFDBDBDB)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFDBDBDB)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF0095F6)),
      ),
    ),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color(0xFF0095F6),
    ),
  );
}
