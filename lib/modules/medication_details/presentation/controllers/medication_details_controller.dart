import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';
import 'package:pillwise_app/modules/medication_details/presentation/widgets/reminder_medication_bottom_sheet.dart';

import '../../../../app/core/widgets/app_image_picker_bottom_sheet.dart';

class MedicationDetailsController extends GetxController {
  final selectedPeriod = tr(LocaleKeys.medicationDetails_daily).obs;
  // TimeOfDay? هو نوع قابل للقيمة الفارغة
  final selectedTime = Rx<TimeOfDay?>(null);

  final periods = [tr(LocaleKeys.medicationDetails_daily), tr(LocaleKeys.medicationDetails_weekly), tr(LocaleKeys.medicationDetails_monthly)];

  // دالة لتغيير الفترة المختارة
  void selectPeriod(String period) {
    selectedPeriod.value = period;
  }

  // دالة لتحديث الوقت المختار
  void updateTime(TimeOfDay? time) {
    selectedTime.value = time;
  }

  // دالة لتهيئة منتقي الوقت (Time Picker)
  Future showAppTimePicker(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime.value ?? TimeOfDay.now()

    );
    if (picked != null) {
      updateTime(picked);
    }
  }

  void showReminderMedicationBottomSheet() {
    Get.bottomSheet(

      backgroundColor: Get.theme.colorScheme.surface,
      ReminderMedicationBottomSheet(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.r),
        ),
      ),
      isDismissible: true,
    );
  }

}
