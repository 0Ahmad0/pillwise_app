import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/core/theme/app_colors.dart';
import 'package:pillwise_app/app/core/theme/app_theme.dart';
// استيراد ملحقاتنا

class SettingsItemWidget extends StatelessWidget {
  final String titleKey;

  final IconData icon;

  final VoidCallback onTap;

  final Widget? trailing;

  final Color? color;

  const SettingsItemWidget({
    super.key,
    required this.titleKey,
    required this.icon,
    required this.onTap,
    this.trailing,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? Get.theme.colorScheme.onSurface;

    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      onTap: onTap,
      leading: Icon(
        icon,
        color: effectiveColor,
      ),
      title: Text(
        tr(titleKey), // <-- استخدام الترجمة
        style: Get.textTheme.bodyMedium?.copyWith(
          color: effectiveColor,
        ),
      ),
      trailing: trailing ??
          Icon(
            Icons.arrow_forward_ios,
            size: 14.sp,
            color: effectiveColor,
          ),
    );
  }
}
