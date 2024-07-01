import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  final String? pdfFilePath;
  final String printType;
  final String pageType;

  PaymentPage({
    this.pdfFilePath,  // Changed to nullable type
    required this.printType,
    required this.pageType,
  });

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _processPayment() {
    // Implement card payment processing functionality here
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Processing card payment...'),
    ));
  }

  void _processBkashPayment() {
    // Implement bKash payment processing functionality here
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Processing bKash payment...'),
    ));
  }

  void _processNagadPayment() {
    // Implement Nagad payment processing functionality here
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Processing Nagad payment...'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Selected File:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(widget.pdfFilePath != null ? widget.pdfFilePath!.split('/').last : 'No file selected'),
            SizedBox(height: 20),
            Text('Print Type: ${widget.printType}', style: TextStyle(fontSize: 16)),
            Text('Page Type: ${widget.pageType}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text('Card Number', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextField(
              controller: _cardNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Enter card number'),
            ),
            SizedBox(height: 16),
            Text('Expiry Date', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextField(
              controller: _expiryDateController,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(hintText: 'MM/YY'),
            ),
            SizedBox(height: 16),
            Text('CVV', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextField(
              controller: _cvvController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Enter CVV'),
            ),
            SizedBox(height: 16),
            Text('Amount', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Enter amount'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _processPayment,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,  // Text color
                backgroundColor: Colors.red,    // Button background color
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                textStyle: TextStyle(fontSize: 16),
              ),
              child: Text('Pay with Card'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _processBkashPayment,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,  // Text color
                backgroundColor: Colors.red,    // Button background color
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                textStyle: TextStyle(fontSize: 16),
              ),
              child: Text('Pay with bKash'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _processNagadPayment,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,  // Text color
                backgroundColor: Colors.red,    // Button background color
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                textStyle: TextStyle(fontSize: 16),
              ),
              child: Text('Pay with Nagad'),
            ),
          ],
        ),
      ),
    );
  }
}
