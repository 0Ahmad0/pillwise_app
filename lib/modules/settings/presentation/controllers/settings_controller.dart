import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/core/utils/app_validator.dart';
import 'package:pillwise_app/modules/welcome/presentation/screens/welcome_screen.dart';

class SettingsController extends GetxController {

  final RxBool notificationsEnabled = true.obs;
  final Rx<Locale> locale = Get.deviceLocale!.obs;
  final Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  void toggleNotifications(bool value) {
    notificationsEnabled.value = value;
    Get.snackbar("Notifications", "Notifications ${value ? 'Enabled' : 'Disabled'}");
  }

  // --- دوال تغيير اللغة ---
  void changeLanguage(String languageCode,BuildContext context) {
    if (languageCode == locale.value.languageCode) return; // لا تغيير

    // 1. تحديث واجهة المستخدم (GetX)
    Locale newLocale = Locale(languageCode);
    Get.updateLocale(newLocale);
    context.setLocale(newLocale);
    locale.value = newLocale; // تحديث المتغير التفاعلي

    // 2. حفظ الاختيار
  }

  // --- دوال تغيير الثيم ---
  void changeTheme() {
    // 1. التحقق من السطوع "الفعلي" (حتى لو كان system)
    bool isCurrentlyDark = Get.isDarkMode;

    // 2. تحديد الوضع الجديد (التبديل)
    ThemeMode newThemeMode = isCurrentlyDark ? ThemeMode.light : ThemeMode.dark;

    // (لا حاجة للتحقق من التكرار، GetX يعالج ذلك)

    // 3. تحديث واجهة المستخدم (GetX)
    Get.changeThemeMode(newThemeMode);
    themeMode.value = newThemeMode; // تحديث المتغير التفاعلي
    // 4. حفظ الاختيار
    // bool isDark = (newThemeMode == ThemeMode.dark);
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