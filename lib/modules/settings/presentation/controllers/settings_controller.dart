import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {

  final RxBool notificationsEnabled = true.obs;
  final Rx<Locale> locale = Get.deviceLocale!.obs;
  final Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  void toggleNotifications(bool value) {
    notificationsEnabled.value = value;
    Get.snackbar("Notifications", "Notifications ${value ? 'Enabled' : 'Disabled'}");
  }

  // --- دوال تغيير اللغة ---
  void changeLanguage(String languageCode) {
    if (languageCode == locale.value.languageCode) return; // لا تغيير

    // 1. تحديث واجهة المستخدم (GetX)
    Locale newLocale = Locale(languageCode);

    Get.updateLocale(newLocale);
    locale.value = newLocale; // تحديث المتغير التفاعلي

    // 2. حفظ الاختيار
  }

  // --- دوال تغيير الثيم ---
  void changeTheme(ThemeMode newThemeMode) {
    if (newThemeMode == themeMode.value) return; // لا تغيير

    // 1. تحديث واجهة المستخدم (GetX)
    Get.changeThemeMode(newThemeMode);
    themeMode.value = newThemeMode; // تحديث المتغير التفاعلي

    // 2. حفظ الاختيار
    bool isDark = (newThemeMode == ThemeMode.dark);
    // _storageService.saveTheme(isDark);
  }

  void logout() {
    Get.defaultDialog(
      title: "Confirm Logout",
      middleText: "Are you sure you want to logout?",
      textConfirm: "Logout",
      textCancel: "Cancel",
      onConfirm: () {

      },
    );
  }
}