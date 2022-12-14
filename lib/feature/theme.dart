import 'package:flutter/material.dart';

class Themes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(41, 50, 65, 1),
    colorScheme: const ColorScheme.dark(),
    primaryColor: const Color.fromRGBO(224, 251, 252, 1),
    iconTheme: const IconThemeData(color: Color.fromRGBO(238, 108, 77, 1), opacity: 0.8),
    cardColor: const Color.fromRGBO(61, 90, 128, 1),
    shadowColor: const Color.fromRGBO(152, 193, 217, 1)
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(224, 251, 252, 1),
    colorScheme: const ColorScheme.light(),
    primaryColor: const Color.fromRGBO(41, 50, 65, 1),
    iconTheme: const IconThemeData(color: Color.fromRGBO(41, 50, 65, 1), opacity: 0.8),
    cardColor: const Color.fromRGBO(152, 193, 217, 1),
    shadowColor: const Color.fromRGBO(61, 90, 128, 1)
  );
}