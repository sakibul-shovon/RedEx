import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:redex/firebase_options.dart';
import 'loginPage.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Login());
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color.fromRGBO(36, 39, 44, 1)),
      home: LoginPage(),
    );
  }
}
