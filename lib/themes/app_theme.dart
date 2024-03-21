import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 147, 146, 148)),
      useMaterial3: true,

      primaryColor: Colors.blue, // Change the primary color
      hintColor: Colors.black, // Change the accent color

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue, // Change the app bar background color
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white, // Change the app bar title text color
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor:
              Colors.blueGrey, // Change the text color on the button
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
        ),
      ),
    );
  }
}
