import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// final theme = ThemeData(
//   textTheme: GoogleFonts.openSansTextTheme(),
//   primaryColorDark: const Color(0xFF0097A7),
//   primaryColorLight: const Color(0xFFB2EBF2),
//   primaryColor: const Color(0xFF00BCD4),
//   accentColor: const Color(0xFF009688),
//   scaffoldBackgroundColor: const Color(0xFFE0F2F1),
//   inputDecorationTheme: InputDecorationTheme(
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(8),
//     ),
//   ),
// );

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(color: Colors.red, opacity: 0.8),
  );

  static final cupertinoDarkTheme = CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.grey.shade900,
    barBackgroundColor: Colors.grey.shade900,
  );

  static final cupertinoLightTheme = CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    barBackgroundColor: Colors.white,
  );
}
