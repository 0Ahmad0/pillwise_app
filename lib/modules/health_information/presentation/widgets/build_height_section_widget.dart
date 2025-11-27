import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/controllers/image_picker_controller.dart';
import 'package:pillwise_app/app/core/widgets/app_text_filed_widget.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';

import '../controllers/health_information_controller.dart';

class BuildHeightSectionWidget extends GetView<HealthInformationController> {
  const BuildHeightSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr(LocaleKeys.health_info_height),
          style:
              Get.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        10.verticalSpace,
        Obx(
          () => AppTextFormFieldWidget(
            controller: TextEditingController(
              text: controller.healthInfo.value.height?.toString() ?? '',
            ),
            keyboardType: TextInputType.number,
            prefixIcon: Icons.height,
            hintText: tr(LocaleKeys.health_info_height),
          ),
        ),
      ],
    );
  }
}
