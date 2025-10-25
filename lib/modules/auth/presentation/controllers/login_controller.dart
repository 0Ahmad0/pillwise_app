import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/routes/app_routes.dart';

class LoginController extends GetxController{
  final TextEditingController userNameOrEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final RxBool rememberMe = false.obs;

  void toggleRememberMe(bool? newValue) {
    rememberMe.value = newValue ?? false;
  }

  Future<void> processLogin() async {
    final isValid = formKey.currentState!.validate();

    if (!isValid) {
      Get.snackbar("خطأ", "الرجاء التأكد من جميع الحقول المدخلة");
      return;
    }else{
      Get.offAllNamed(AppRoutes.home);
    }
  }

  @override
  void onClose() {
    userNameOrEmailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}