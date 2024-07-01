import 'package:flutter/material.dart';
import 'package:redex/Components/my_drawer.dart';
import 'package:redex/Pages/print_order_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrintOrderPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,  // Text color
                backgroundColor: Colors.red,    // Button background color
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                textStyle: TextStyle(fontSize: 16),
              ),
              child: Text('Go to PDF Upload Page'),
            ),
          ],
        ),
      ),
    );
  }
}
