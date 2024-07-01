import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redex/auth/login_or_register.dart';
import 'package:redex/themes/themeProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const LoginOrRegister(),
          theme: themeProvider.themeData,
        );
      },
    );
  }
}
