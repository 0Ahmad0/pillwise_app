import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/core/theme/app_colors.dart';
import 'package:pillwise_app/app/core/widgets/app_image_picker_bottom_sheet.dart';
import 'package:pillwise_app/app/extension/opacity_extension.dart';

import '../controllers/medication_details_controller.dart';

class PeriodSelectorWidget extends StatelessWidget {
  const PeriodSelectorWidget({
    super.key,
    required this.controller,
    required this.label,
  });

  final MedicationDetailsController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isSelected = controller.selectedPeriod.value == label;

      return Expanded(
        child: GestureDetector(
          onTap: () {
            controller.selectPeriod(label);
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            padding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
            decoration: BoxDecoration(
              color: isSelected ? Get.theme.primaryColor.myOpacity(0.075) : null,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: isSelected ? Get.theme.primaryColor : AppColors.transparent,
                width: .5
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              label,
              style: Get.textTheme.bodyMedium?.copyWith(
                color: isSelected ? null : AppColors.greyColor,
                  fontWeight: isSelected? FontWeight.bold:null
              ),
            ),
          ),
        ),
      );
    });
  }
}
