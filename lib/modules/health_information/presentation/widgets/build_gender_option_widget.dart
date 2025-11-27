import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/controllers/image_picker_controller.dart';
import 'package:pillwise_app/app/core/theme/app_colors.dart';
import 'package:pillwise_app/app/core/widgets/app_image_picker_bottom_sheet.dart';
import 'package:pillwise_app/app/extension/opacity_extension.dart';
import 'package:pillwise_app/modules/health_information/presentation/controllers/health_information_controller.dart';

class BuildGenderOptionWidget extends GetView<HealthInformationController> {
  final bool isSelected;
  final String gender;
  final IconData icon;

  const BuildGenderOptionWidget({
    super.key,
    required this.isSelected,
    required this.gender,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.updateGender(gender),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? Get.theme.primaryColor.myOpacity(0.075) : null,
          border: Border.all(
            color: isSelected ? Get.theme.primaryColor : AppColors.greyColor,
            width: isSelected ? .5 : .25,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                gender,
                style: Get.textTheme.bodyMedium?.copyWith(
                    color: isSelected
                        ? Get.theme.primaryColor
                        : AppColors.greyColor),
              ),
              10.horizontalSpace,
              Icon(
                icon,
                color: isSelected ? Get.theme.primaryColor : AppColors.greyColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
