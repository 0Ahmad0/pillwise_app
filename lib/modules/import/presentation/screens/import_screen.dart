import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/import_controller.dart';

class ImportScreen extends GetView<ImportController> {
  const ImportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ImportScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ImportScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
