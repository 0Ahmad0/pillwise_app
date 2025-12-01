import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/core/theme/app_colors.dart';

class BuildDetailRowWidget extends StatelessWidget {
  const BuildDetailRowWidget({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$label:  ",
            style: Get.textTheme.bodyMedium?.copyWith(
              color: AppColors.greyColor,
            )),
        Expanded(
          child: Text(value,
              style: Get.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp
              )),
        ),
      ],
    );
  }
}
