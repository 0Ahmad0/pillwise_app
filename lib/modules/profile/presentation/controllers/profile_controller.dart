import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';

class ProfileController extends GetxController {
  final profileFormKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  final Rx<File?> selectedImage = Rx<File?>(null);

  final ImagePicker _picker = ImagePicker();

  final List<String> countries = [
    tr(LocaleKeys.countries_EG) + ' 🇪🇬',
    tr(LocaleKeys.countries_SA) + ' 🇸🇦',
    tr(LocaleKeys.countries_AE) + ' 🇦🇪',
    tr(LocaleKeys.countries_QA) + ' 🇶🇦',
    tr(LocaleKeys.countries_KW) + ' 🇰🇼',
    tr(LocaleKeys.countries_BH) + ' 🇧🇭',
    tr(LocaleKeys.countries_OM) + ' 🇴🇲',
    tr(LocaleKeys.countries_JO) + ' 🇯🇴',
    tr(LocaleKeys.countries_LB) + ' 🇱🇧',
    tr(LocaleKeys.countries_SY) + ' 🇸🇾',
    tr(LocaleKeys.countries_IQ) + ' 🇮🇶',
    tr(LocaleKeys.countries_PS) + ' 🇵🇸',
    tr(LocaleKeys.countries_YE) + ' 🇾🇪',
    tr(LocaleKeys.countries_LY) + ' 🇱🇾',
    tr(LocaleKeys.countries_TN) + ' 🇹🇳',
    tr(LocaleKeys.countries_DZ) + ' 🇩🇿',
    tr(LocaleKeys.countries_MA) + ' 🇲🇦',
    tr(LocaleKeys.countries_MR) + ' 🇲🇷',
    tr(LocaleKeys.countries_SD) + ' 🇸🇩',
    tr(LocaleKeys.countries_SO) + ' 🇸🇴',
    tr(LocaleKeys.countries_DJ) + ' 🇩🇯',
    tr(LocaleKeys.countries_KM) + ' 🇰🇲',
  ];




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
