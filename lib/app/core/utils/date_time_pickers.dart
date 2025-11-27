import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDateTimePickers {
  // Time Picker عام - مصحح
  static Future<TimeOfDay?> showAppTimePicker({
    TimeOfDay? initialTime,
    String? confirmText,
    String? cancelText,
    String? helpText,
    bool barrierDismissible = true,
  }) async {
    final TimeOfDay now = TimeOfDay.now();

    final TimeOfDay? picked = await showTimePicker(
      context: Get.context!,
      initialTime: initialTime ?? now,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: _getPickerTheme(),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          ),
        );
      },
      confirmText: confirmText ?? 'موافق',
      cancelText: cancelText ?? 'إلغاء',
      helpText: helpText ?? 'اختر الوقت',
      barrierDismissible: barrierDismissible,
    );

    return picked;
  }

  // Date Picker عام - مصحح
  static Future<DateTime?> showAppDatePicker({
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    String? confirmText,
    String? cancelText,
    String? helpText,
    String? errorFormatText,
    String? errorInvalidText,
    String? fieldHintText,
    String? fieldLabelText,
    bool barrierDismissible = true,
  }) async {
    final DateTime now = DateTime.now();
    final DateTime initial = initialDate ?? now;
    final DateTime first = firstDate ?? DateTime(1900);
    final DateTime last = lastDate ?? DateTime(2100);

    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: initial,
      firstDate: first,
      lastDate: last,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: _getPickerTheme(),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          ),
        );
      },
      confirmText: confirmText ?? 'موافق',
      cancelText: cancelText ?? 'إلغاء',
      helpText: helpText ?? 'اختر التاريخ',
      errorFormatText: errorFormatText ?? 'صيغة تاريخ غير صالحة',
      errorInvalidText: errorInvalidText ?? 'تاريخ خارج النطاق',
      fieldHintText: fieldHintText ?? 'يوم/شهر/سنة',
      fieldLabelText: fieldLabelText ?? 'التاريخ',
      barrierDismissible: barrierDismissible,
    );

    return picked;
  }

  // Birth Date Picker مخصص لتاريخ الميلاد - مصحح
  static Future<DateTime?> showAppBirthDatePicker({
    DateTime? initialDate,
    String? helpText,
  }) async {
    final DateTime now = DateTime.now();
    final DateTime initial = initialDate ?? DateTime(now.year - 20, 1, 1);

    return await showAppDatePicker(
      initialDate: initial,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      helpText: helpText ?? 'اختر تاريخ الميلاد',
      confirmText: 'تأكيد',
      cancelText: 'إلغاء',
    );
  }

  // الحصول على الثيم المناسب
  static ThemeData _getPickerTheme() {
    final ThemeData baseTheme = Get.theme;

    return baseTheme.copyWith(
      colorScheme: baseTheme.colorScheme.copyWith(
        primary: baseTheme.primaryColor,
        onPrimary: Colors.white,
        surface: baseTheme.cardColor,
        onSurface: baseTheme.textTheme.bodyLarge?.color ?? Colors.black,
      ),
      dialogBackgroundColor: baseTheme.cardColor,
      textTheme: baseTheme.textTheme.copyWith(
        titleMedium: baseTheme.textTheme.titleMedium?.copyWith(
          color: baseTheme.textTheme.bodyLarge?.color,
        ),
      ),
    );
  }
}