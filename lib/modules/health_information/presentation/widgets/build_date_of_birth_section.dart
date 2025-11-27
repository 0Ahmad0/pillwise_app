import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/controllers/image_picker_controller.dart';
import 'package:pillwise_app/app/core/utils/date_time_pickers.dart';
import 'package:pillwise_app/app/core/widgets/app_text_filed_widget.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';
import 'package:pillwise_app/modules/health_information/presentation/controllers/health_information_controller.dart';

class BuildDateOfBirthSection extends GetView<HealthInformationController> {
  const BuildDateOfBirthSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr(LocaleKeys.health_info_date_of_birth),
          style:
          Get.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        10.verticalSpace,
        AppTextFormFieldWidget(
          controller: controller.dateOfBirthController,
          onTap: () async {
            final c = await AppDateTimePickers.showAppBirthDatePicker();
            if (c != null) {
              controller.updateDateOfBirth(c);
            }
          },
          readOnly: true,
          prefixIcon: Icons.calendar_today,
          hintText: tr(LocaleKeys.health_info_date_of_birth),
        ),

      ],
    );
  }

}
