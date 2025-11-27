import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppTextButtonWidget extends StatelessWidget {
  final String text;

  final VoidCallback? onPressed;

  final bool isLoading;

  final Color? color;
  final Color? backGroundColor;
  final bool isFullWidth;

  const AppTextButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.color,
    this.isFullWidth = false,
    this.backGroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? Get.theme.primaryColor;

    return TextButton(
      onPressed: isLoading ? null : onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isFullWidth ? 8.r : 0),
          side: isFullWidth?BorderSide(
            color: Get.theme.primaryColor,
            width: .5
          ):BorderSide.none,
        ),
        backgroundColor: isFullWidth ? backGroundColor : null,
        fixedSize: isFullWidth ? const Size(double.maxFinite, 54) : null,
        padding: EdgeInsets.zero,
        foregroundColor: effectiveColor,
        // 3. تطبيق اللون
        textStyle: Get.textTheme.bodyMedium,
      ),
      child: isLoading
          ? _buildLoading(effectiveColor) // 4. عرض مؤشر تحميل
          : Text(
              text,
            ), // 5. عرض النص
    );
  }

  Widget _buildLoading(Color color) {
    return SizedBox(
      height: 18.h,
      width: 18.h,
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
