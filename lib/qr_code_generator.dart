// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeGeneratorScreen extends StatefulWidget {
  const QRCodeGeneratorScreen({super.key});

  @override
  _QRCodeGeneratorScreenState createState() => _QRCodeGeneratorScreenState();
}

class _QRCodeGeneratorScreenState extends State<QRCodeGeneratorScreen> {
  final TextEditingController _controller = TextEditingController();
  String _inputText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Generator'),
        centerTitle: true,
        backgroundColor: Colors.green[300],
      ),
      body: SingleChildScrollView(
        // ignore: prefer_const_constructors
        padding: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter text to generate QR code',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _inputText = _controller.text;
                  });
                },
                child: const Text('Generate QR Code'),
              ),
              const SizedBox(height: 20),
              // Check if input text is not empty and show the QR code

              _inputText.isNotEmpty
                  ? QrImageView(
                      data: _inputText, // Data to encode in the QR code
                      version: QrVersions
                          .auto, // Automatically choose the best QR version
                      size: 200.0, // Size of the QR code
                    )
                  : Container(), // If no input, show an empty container
            ],
          ),
        ),
      ),
    );
  }
}
