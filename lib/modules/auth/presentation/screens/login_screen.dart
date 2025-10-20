import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/modules/auth/presentation/controllers/auth_controller.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LoginScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
