
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/core/widgets/app_text_filed_widget.dart';
import '../../../../generated/locale_keys.g.dart';
import '../controllers/health_information_controller.dart';

class BuildWeightSectionWidget extends GetView<HealthInformationController> {
  const BuildWeightSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr(LocaleKeys.health_info_weight),
          style: Get.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        10.verticalSpace,
        Obx(() =>
            AppTextFormFieldWidget(
              prefixIcon: Icons.scale,
              keyboardType: TextInputType.number,
              hintText: tr(LocaleKeys.health_info_weight),
              controller: TextEditingController(
                text: controller.healthInfo.value.weight?.toString() ?? '',
              ),
            )),
      ],
    );
  }
}
