import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/controllers/image_picker_controller.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';
import 'package:pillwise_app/modules/health_information/presentation/controllers/health_information_controller.dart';
import 'package:pillwise_app/modules/health_information/presentation/widgets/build_gender_option_widget.dart';

class BuildGenderWidget extends GetView<HealthInformationController> {
  const BuildGenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr(LocaleKeys.health_info_gender),
          style: Get.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold
          ),
        ),
        10.verticalSpace,
        Obx(() => Row(
              children: [
                Expanded(
                  child: BuildGenderOptionWidget(
                    icon: Icons.female,
                    gender: tr(LocaleKeys.health_info_female_g),
                    isSelected: controller.healthInfo.value.gender == tr(LocaleKeys.health_info_female_g),
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: BuildGenderOptionWidget(
                    icon: Icons.male,
                    gender: tr(LocaleKeys.health_info_male_g),
                    isSelected: controller.healthInfo.value.gender == tr(LocaleKeys.health_info_male_g),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
