import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pillwise_app/app/core/constants/app_assets.dart';
import 'package:pillwise_app/app/core/widgets/app_svg_widget.dart';
import 'package:pillwise_app/main.dart';
import 'package:pillwise_app/modules/splash/presentation/screens/splash_screen.dart';

import '../../data/models/onboarding_item_model.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingPageWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 1. مربع الصورة (Lottie)
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Get.theme.primaryColor.withOpacity(.2),
                    borderRadius: BorderRadius.circular(14.r)),
                child: AspectRatio(
                  aspectRatio: 1, // يجعلها مربعة
                  child: Lottie.asset(
                    item.lottieAsset,
                  ),
                ),
              ),
              Positioned(
                top: -24,
                child: Transform.rotate(
                  angle: -.5,
                  child: AppSvgWidget(
                    assetsUrl: 'assets/icons/splash_heart_icon.svg',
                    width: 50.w,
                    height: 50.w,
                  ).heartBeat(
                    infinite: true
                  ),
                ),
              )
            ],
          ),
          32.verticalSpace, // مسافة متجاوبة

          // 2. النص العريض (العنوان)
          Text(
            item.title,
            style: Get.textTheme.headlineMedium, // <-- من الثيم
            textAlign: TextAlign.center,
          ),
          16.verticalSpace, // مسافة متجاوبة

          // 3. النص العادي (الوصف)
          Text(
            item.subtitle,
            style: Get.textTheme.bodyLarge, // <-- من الثيم
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
