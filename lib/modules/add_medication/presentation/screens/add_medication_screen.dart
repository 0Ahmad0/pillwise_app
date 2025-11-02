import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_medication_controller.dart';

class AddMedicationScreen extends GetView<AddMedicationController> {
  const AddMedicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddMedicationScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AddMedicationScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
