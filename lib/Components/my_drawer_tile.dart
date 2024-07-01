import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onTap;
  const MyDrawerTile({super.key, required this.text, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(color: Colors.black),  // Text color set to black
        ),
        leading: Icon(
          icon,
          color: Colors.black,  // Icon color set to black
        ),
        onTap: onTap,
      ),
    );
  }
}
