import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {

  final RxBool notificationsEnabled = true.obs;

  void toggleNotifications(bool value) {
    notificationsEnabled.value = value;
    Get.snackbar("Notifications", "Notifications ${value ? 'Enabled' : 'Disabled'}");
  }

  void changeTheme() {
    Get.changeThemeMode(
      Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
    );
  }

  void logout() {
    Get.defaultDialog(
      title: "Confirm Logout",
      middleText: "Are you sure you want to logout?",
      textConfirm: "Logout",
      textCancel: "Cancel",
      onConfirm: () {
        //Logout Code
      },
    );
  }
}