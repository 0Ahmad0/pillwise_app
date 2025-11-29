import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pillwise_app/app/core/theme/app_colors.dart';

class BuildContactRowWidget extends StatelessWidget {
  const BuildContactRowWidget({
    super.key,
    required this.icon,
    required this.labelKey,
    required this.value,
    required this.color,
    this.onTap,
  });

  final IconData icon;

  final String labelKey;

  final String value;

  final Color color;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(tr(labelKey),
            style: Get.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold
            )),
        subtitle: Text(value, style: Get.textTheme.bodyMedium?.copyWith(
          color: AppColors.greyColor
        )),
        trailing: onTap != null
            ? Icon(Icons.keyboard_double_arrow_left, color: color.withOpacity(0.7))
            : null,
        onTap: onTap, // لتمكين النقر للاتصال أو الإرسال
      ),
    );
  }
}
