import 'package:flutter/material.dart';
import'loginPage.dart';
void main() => runApp(Login());

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color.fromRGBO(36, 39, 44, 1)
      ),
      home: LoginPage(),
    );
  }
}