

import 'package:flutter/material.dart';
import 'package:redex/Components/MyButton.dart';
import 'package:redex/Components/MyTextField.dart';
import 'package:redex/Pages/home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.primary,
            ),

            SizedBox(height: 25),

            // App slogan
            Text(
              'RedEx',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            SizedBox(height: 25),

            // Email text field
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),

            SizedBox(height: 25),

            // Password text field
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),

            SizedBox(height: 25),

            // Sign in button
            MyButton(
              text: 'Sign In',
              onTap: login,
            ),

            SizedBox(height: 25),

            // Register section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Register Now',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}