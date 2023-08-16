import 'package:flutter/material.dart';

class AppThemes {
  static Color primary = const Color(0xFFb61b1c);
  static Color secondary = const Color.fromARGB(255, 32, 32, 32);
  static Color third = const Color.fromARGB(255, 230, 196, 1);
  static Color forty = const Color.fromARGB(255, 255, 255, 255);

  static ThemeData darkTheme = ThemeData.light().copyWith(
      primaryColor: forty,
      brightness: Brightness.light,
      appBarTheme:
          const AppBarTheme(color: Color.fromARGB(255, 0, 0, 0), elevation: 0),
      scaffoldBackgroundColor: const Color.fromRGBO(241, 241, 245, 1));

  static ThemeData lightTheme = ThemeData.dark().copyWith(
      primaryColor: primary,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(color: Colors.brown, elevation: 0),
      scaffoldBackgroundColor: const Color.fromARGB(223, 63, 44, 44));
}
