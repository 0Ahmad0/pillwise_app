import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/core/models/medicine_model.dart';
import 'package:pillwise_app/app/core/widgets/app_button_widget.dart';
import 'package:pillwise_app/app/core/widgets/app_padding_widget.dart';
import 'package:pillwise_app/app/core/widgets/app_text_filed_widget.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';
import 'package:pillwise_app/modules/medication_details/presentation/controllers/medication_details_controller.dart';
import 'package:pillwise_app/modules/medication_details/presentation/widgets/period_selector_widget.dart';

import '../../../../app/core/local/storage.dart';
import '../../../../app/core/services/notification_service.dart';

class ReminderMedicationBottomSheet
    extends GetView<MedicationDetailsController> {
  const ReminderMedicationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPaddingWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          10.verticalSpace,
          Align(
            alignment: Alignment.center,
            child: Text(
              tr(LocaleKeys.medicationDetails_add_reminder),
              style: Get.textTheme.displayMedium?.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          24.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: controller.periods
                .map((period) =>
                    PeriodSelectorWidget(controller: controller, label: period))
                .toList(),
          ),
          20.verticalSpace,

          Text(
            tr(LocaleKeys.medicationDetails_reminder_time),
            style:
                Get.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          10.verticalSpace,
          Obx(
            () => AppTextFormFieldWidget(
              readOnly: true,
              onTap: () => controller.showAppTimePicker(context),
              hintText: controller.selectedTime.value == null
                  ? tr(LocaleKeys.medicationDetails_reminder_time)
                  : controller.selectedTime.value!.format(context),
              prefixIcon: Icons.access_time_outlined,
            ),
          ),
          40.verticalSpace,
          AppButtonWidget(
              text: tr(LocaleKeys.medicationDetails_add_reminder),
              onPressed: () {
                Get.back();
                final uid= AppStorage.getUserStorage()?.uid;
                final  currentUserMedicine= controller.medicine?.getById(uid??'');


                //TODO : Delete This
                Get.snackbar(
                  "Success",
                  'Reminder set for ${controller.selectedPeriod.value} at ${controller.selectedTime.value?.format(context) ?? 'N/A'}',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
              })
          // 4. Button
        ],
      ),
    );
  }
}
