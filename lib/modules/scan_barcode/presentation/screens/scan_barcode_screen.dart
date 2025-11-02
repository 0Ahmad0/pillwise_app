import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/scan_barcode_controller.dart';

class ScanBarcodeScreen extends GetView<ScanBarcodeController> {
  const ScanBarcodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScanBarcodeScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ScanBarcodeScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
