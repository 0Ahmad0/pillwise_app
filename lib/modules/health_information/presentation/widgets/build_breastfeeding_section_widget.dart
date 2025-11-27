import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';
import 'package:pillwise_app/modules/health_information/presentation/controllers/health_information_controller.dart';

class BuildBreastfeedingSectionWidget extends GetView<HealthInformationController> {
  const BuildBreastfeedingSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SwitchListTile(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r)
      ),
      contentPadding: EdgeInsets.symmetric(
          horizontal: 12.w,
        vertical: 4.h
      ),
      title:  Text(
        tr(LocaleKeys.health_info_breastfeeding),
        style: Get.textTheme.bodyMedium?.copyWith(
          color: controller.healthInfo.value.isBreastfeeding?Get.theme.primaryColor:null
        ),
      ),
      value: controller.healthInfo.value.isBreastfeeding,
      onChanged: controller.updateBreastfeeding,
    ));
  }
}
