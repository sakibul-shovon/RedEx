import 'package:flutter/material.dart';
import 'package:redex_chat_app/common/widgets/error.dart';
import 'package:redex_chat_app/features/auth/screens/login_screen.dart';
import 'package:redex_chat_app/features/auth/screens/otp_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => LoginScreen());

    case OtpScreen.routeName:
    final verificationId = settings.arguments as String;
      return MaterialPageRoute(builder: (context) => OtpScreen(verificationId: verificationId,));

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(error: 'This Page does not exist'),
        ),
      );
  }
}
