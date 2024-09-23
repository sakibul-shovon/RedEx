import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../api/apis.dart';
//import '../services/apis.dart'; // Import your APIs class here

class RedexBalancePage extends StatefulWidget {
  @override
  _RedexBalancePageState createState() => _RedexBalancePageState();
}

class _RedexBalancePageState extends State<RedexBalancePage> {
  double redexCoin = 0.0; // Initially set to 0.0 for new users
  String userId = APIs.user.uid; // Use dynamic user ID from APIs class
  String? selectedPaymentMethod;

  @override
  void initState() {
    super.initState();
    _getRedexCoin();
  }

  // Fetch Redex balance from Firebase using APIs class
  void _getRedexCoin() async {
    try {
      double balance = await APIs.getRedexBalance();
      setState(() {
        redexCoin = balance;
      });
    } catch (e) {
      print("Error fetching Redex Coin: $e");
    }
  }

  // Method to update Redex Coin in Firebase using APIs class
  Future<void> _updateRedexCoin(double newBalance) async {
    await APIs.updateRedexBalance(newBalance);
  }

  void _showPaymentOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text('Select Payment Method', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              DropdownButton<String>(
                value: selectedPaymentMethod,
                hint: const Text('Choose a payment method'),
                items: [
                  DropdownMenuItem(
                    value: 'Bkash',
                    child: Row(
                      children: const [
                        ImageIcon(
                          AssetImage("images/bkash.png"),
                          color: Color.fromRGBO(209, 32, 83, 1),
                          size: 50,
                        ),
                        SizedBox(width: 10),
                        Text('Buy with Bkash'),
                      ],
                    ),
                  ),
                  // Additional payment methods...
                ],
                onChanged: (String? value) {
                  setState(() {
                    selectedPaymentMethod = value;
                  });
                  Navigator.pop(context);
                  _showSelectedPayment(value);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSelectedPayment(String? method) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('You selected: $method')),
    );
  }

  // Method to buy Redex Coin
  void _buyRedexCoin() async {
    // Example increment; replace with actual logic
    double newBalance = redexCoin + 10.0;
    await _updateRedexCoin(newBalance);
    setState(() {
      redexCoin = newBalance;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Successfully purchased Redex Coins!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Redex Balance'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 170.0, left: 30.0),
            child: Column(
              children: [
                const Text(
                  'Your Redex Coin Balance',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20.0),
                Text(
                  redexCoin.toStringAsFixed(2),
                  style: const TextStyle(fontSize: 48.0, color: Colors.amber, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 350.0, left: 35),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              onPressed: () {
                _buyRedexCoin();
                _showPaymentOptions();
              },
              child: const Text(
                'Buy Redex Coin',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
