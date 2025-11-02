import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/health_information_controller.dart';

class HealthInformationScreen extends GetView<HealthInformationController> {
  const HealthInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HealthInformationScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HealthInformationScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
