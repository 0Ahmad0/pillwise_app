import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/extension/opacity_extension.dart';

import '../../../../app/core/theme/app_colors.dart';

class InfoIconWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoIconWidget(
      {required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (Get.width - 72.w)/3,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Get.theme.primaryColor.myOpacity(.075),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Get.theme.primaryColor,
              size: 20.sp,
            ),
          ),
          8.verticalSpace,
          Text(label,
              style: Get.textTheme.bodySmall
                  ?.copyWith(color: AppColors.greyColor, fontSize: 10.sp)),
          Text(
            value,
            style: Get.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold, fontSize: 12.sp),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
