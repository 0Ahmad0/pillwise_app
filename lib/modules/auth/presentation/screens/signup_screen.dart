import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/modules/auth/presentation/controllers/auth_controller.dart';

class SignupScreen extends GetView<AuthController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignupScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SignupScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
