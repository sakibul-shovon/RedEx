import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:redex/Pages/PaymentPage.dart';


class PrintOrderPage extends StatefulWidget {
  @override
  _PrintOrderPageState createState() => _PrintOrderPageState();
}

class _PrintOrderPageState extends State<PrintOrderPage> {
  String? _pdfFilePath;
  String _printType = 'Color';
  String _pageType = 'A4';
  final List<String> _printTypes = ['Color', 'Black & White'];
  final List<String> _pageTypes = ['A4', 'A6', 'Letter', 'Legal'];

  void _pickPdfFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _pdfFilePath = result.files.single.path;
      });
    }
  }

  void _proceedToPayment() {
    // Pass the selected file path, print type, and page type to the PaymentPage
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentPage(
          pdfFilePath: _pdfFilePath,  // Pass file path
          printType: _printType,     // Pass print type
          pageType: _pageType,       // Pass page type
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Print Order'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _pickPdfFile,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,  // Text color
                  backgroundColor: Colors.red,    // Button background color
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  textStyle: TextStyle(fontSize: 16),
                ),
                child: Text('Submit PDF'),
              ),
              if (_pdfFilePath != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    'Selected File: ${_pdfFilePath!.split('/').last}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              SizedBox(height: 20),
              Text(
                'Print Type:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              DropdownButton<String>(
                value: _printType,
                onChanged: (String? newValue) {
                  setState(() {
                    _printType = newValue!;
                  });
                },
                items: _printTypes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(fontSize: 16)),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Page Type:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              DropdownButton<String>(
                value: _pageType,
                onChanged: (String? newValue) {
                  setState(() {
                    _pageType = newValue!;
                  });
                },
                items: _pageTypes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(fontSize: 16)),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _proceedToPayment,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,  // Text color
                  backgroundColor: Colors.red,    // Button background color
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  textStyle: TextStyle(fontSize: 16),
                ),
                child: Text('Proceed to Payment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
