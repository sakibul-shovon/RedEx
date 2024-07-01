import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    background: Color.fromARGB(255, 20, 20, 20),
    primary: Color.fromARGB(255, 122, 122, 20),
    secondary: Color.fromARGB(255, 47, 47, 47),
    tertiary: Colors.grey.shade100,
    onBackground: Colors.white,  // Text color for dark mode
  ),
);
