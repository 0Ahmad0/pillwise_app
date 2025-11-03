import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final profileFormKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  final Rx<File?> selectedImage = Rx<File?>(null);

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) selectedImage.value = File(image.path);
  }

  Future<void> pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) selectedImage.value = File(image.path);
  }

  void removeImage() {
    selectedImage.value = null;
  }


  // Validation Methods
  // String? validateUsername(String? value) {
  //   return FieldValidator([
  //     RequiredValidator(),
  //     UsernameValidator(),
  //   ]).validate(value ?? '');
  // }
  // String? validateFullName(String? value) {
  //   return FieldValidator([
  //     RequiredValidator(),
  //   ]).validate(value ?? '');
  // }
  //
  // String? validateEmail(String? value) {
  //   return FieldValidator([
  //     RequiredValidator(),
  //     EmailValidator(),
  //   ]).validate(value ?? '');
  // }
  //
  // String? validatePhone(String? value) {
  //   return FieldValidator([
  //     RequiredValidator(),
  //     PhoneNumberValidator(),
  //   ]).validate(value ?? '');
  // }

  void editProfile() {
    if (profileFormKey.currentState?.validate() ?? false) {
      print('تسجيل المستخدم: ${usernameController.text}');
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }

}
