import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/core/widgets/app_padding_widget.dart';

import '../../../../app/core/theme/app_colors.dart';

class BuildSectionHeaderWidget extends StatelessWidget {
  const BuildSectionHeaderWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AppPaddingWidget(
      padding: EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 14.h
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.success),
          10.horizontalSpace,
          Text(
            title,
            style: Get.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
