import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class UploadFilesPage extends StatefulWidget {
  const UploadFilesPage({Key? key}) : super(key: key);

  @override
  State<UploadFilesPage> createState() => _UploadFilesPageState();
}

class _UploadFilesPageState extends State<UploadFilesPage> {
  String? _filePath;
  String? _colorOption;
  String? _paperSize;
  double _totalCost = 0.0;
  int? _pageCount;

  final List<String> _colorOptions = ['Black & White', 'Color'];
  final List<String> _paperSizes = ['A4', 'A3', 'Letter'];

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result != null && result.files.single.path != null) {
      setState(() {
        _filePath = result.files.single.path;
      });
      _getPageCount(_filePath!);
    }
  }

  Future<void> _getPageCount(String filePath) async {
    final file = File(filePath);
    final bytes = await file.readAsBytes();
    final pdfDocument = PdfDocument(inputBytes: bytes);
    setState(() {
      _pageCount = pdfDocument.pages.count;
      _calculateTotalCost();
    });
  }

  void _showPdfPreview(String filePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            height: 500,
            width: 400,
            child: Column(
              children: [
                Expanded(
                  child: SfPdfViewer.file(File(filePath)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('Close Preview'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _viewPdf() {
    if (_filePath != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text('PDF Viewer'),
            ),
            body: Center(
              child: SfPdfViewer.file(File(_filePath!)),
            ),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No PDF selected to view')),
      );
    }
  }

  void _calculateTotalCost() {
    double baseCost = 5.0;
    if (_colorOption == 'Color') baseCost += 2.0;
    if (_paperSize == 'A3') baseCost += 1.0;
    if (_paperSize == 'Letter') baseCost += 0.5;
    if (_pageCount != null) baseCost *= _pageCount!;
    setState(() {
      _totalCost = baseCost;
    });
  }

  void _checkout() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const CheckoutPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Files'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[Color(0xFF4A90E2), Color(0xFF50B5D1)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 10.0,
        shadowColor: Colors.grey.withOpacity(0.5),
        titleTextStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: ElevatedButton.icon(
                onPressed: _pickFile,
                icon: const Icon(Icons.upload_file),
                label: const Text('Upload PDF'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(12),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _viewPdf,
                child: const Text('View PDF'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(12),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: SizedBox(
                width: 300,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Select Color',
                    labelStyle: const TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                  ),
                  items: _colorOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _colorOption = newValue;
                      _calculateTotalCost();
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: SizedBox(
                width: 300,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Select Paper Size',
                    labelStyle: const TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                  ),
                  items: _paperSizes.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _paperSize = newValue;
                      _calculateTotalCost();
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (_pageCount != null)
              Center(
                child: Text(
                  'Number of Pages: $_pageCount',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'Total Cost: \৳$_totalCost',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _checkout,
              child: const Text('Checkout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(16),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[Color(0xFF4A90E2), Color(0xFF50B5D1)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 10.0,
        shadowColor: Colors.grey.withOpacity(0.5),
        titleTextStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Checkout Page',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.grey.shade700,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
