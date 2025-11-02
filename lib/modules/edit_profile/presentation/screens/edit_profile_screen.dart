import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditProfileScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EditProfileScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
