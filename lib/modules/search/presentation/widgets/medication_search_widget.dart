import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pillwise_app/app/controllers/image_picker_controller.dart';
import 'package:pillwise_app/app/core/constants/app_assets.dart';
import 'package:pillwise_app/app/core/widgets/app_padding_widget.dart';
import 'package:pillwise_app/app/core/widgets/app_svg_widget.dart';

class MedicationSearchWidget extends StatelessWidget {
  const MedicationSearchWidget(
      {super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 4.h
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      elevation: 0.0,
      child: ListTile(
        onTap: (){},
        leading: AppSvgWidget(
          assetsUrl: AppAssets.capsuleIcon,
          color: Get.theme.primaryColor,
        ),
        title: Text(
          title,
          style:
              Get.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subTitle,
          style: Get.textTheme.bodyMedium?.copyWith(fontSize: 12.sp),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
