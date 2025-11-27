import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';
import '../controllers/settings_controller.dart';

class LanguageToggleWidget extends GetView<SettingsController> {
  const LanguageToggleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. مراقبة متغير اللغة من الكونترولر
    return Obx(() {

      // 2. تحديد اللغة الحالية
      final String currentLangCode = controller.locale.value.languageCode;

      // 3. تحديد النص الذي سيعرض
      // (يفضل استخدام مفاتيح ترجمة "English", "العربية")
      final String text = (currentLangCode == 'ar')
          ? tr(LocaleKeys.core_arabic)
          : tr(LocaleKeys.core_english);

      // 4. بناء الويدجت (نص + أيقونة)
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: Get.textTheme.bodyMedium,
          ),
          4.horizontalSpace, // <-- استخدام المسافة المتجاوبة
          Icon(
            Icons.language, // أيقونة "لغة" ثابتة
            color: Get.theme.primaryColor, // لون الثيم
          ),
        ],
      );
    });
  }
}