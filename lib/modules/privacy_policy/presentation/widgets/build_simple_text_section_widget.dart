import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/controllers/image_picker_controller.dart';
import 'package:pillwise_app/app/core/widgets/app_padding_widget.dart';

class BuildSimpleTextSectionWidget extends StatelessWidget {
  const BuildSimpleTextSectionWidget({
    super.key,
    required this.titleKey,
    required this.icon,
    required this.contentKey,
  });

  final String titleKey;
  final IconData icon;
  final String contentKey;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: AppPaddingWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Get.theme.primaryColor),
                10.horizontalSpace,
                Text(
                  tr(titleKey),
                  style: Get.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 5, right: 5),
              child: Text(
                tr(contentKey),
                style: const TextStyle(
                    fontSize: 15, color: Colors.black87, height: 1.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
