import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/core/widgets/app_padding_widget.dart';
import 'package:pillwise_app/app/extension/opacity_extension.dart';
import 'package:pillwise_app/app/routes/app_routes.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';

import '../../../../app/core/constants/app_assets.dart';
import '../../../../app/core/theme/app_colors.dart';
import '../../../../app/core/widgets/app_svg_widget.dart';

class EmptyDrugsWidget extends StatelessWidget {
  const EmptyDrugsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppPaddingWidget(
          child: GestureDetector(
            onTap: (){
              Get.toNamed(AppRoutes.search);
              // Get.toNamed(AppRoutes.addMedication);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.success.myOpacity(.05),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.success.myOpacity(.5), width: .75),
              ),
              child: Column(
                children: [
                  AppSvgWidget(
                    assetsUrl: AppAssets.emptyDrugsIcon,
                    width: 160.w,
                    height: 160.w,
                  ),
                  20.verticalSpace,
                  Text(
                    tr(LocaleKeys.home_no_drugs_found),
                    textAlign: TextAlign.center,
                    style: Get.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: AppColors.success),
                  ),
                  8.verticalSpace,
                  Text(
                    tr(LocaleKeys.home_no_drugs_found_desc),
                    textAlign: TextAlign.center,
                    style: Get.textTheme.bodyMedium?.copyWith(
                        fontSize: 13.sp,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.greyColor
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
