import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/core/widgets/app_svg_widget.dart';
import 'package:pillwise_app/app/routes/app_routes.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';
import '../controllers/splash_controller.dart';
import 'package:animate_do/animate_do.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(14.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  tr(LocaleKeys.welcome_welcome_text_app),
                  textAlign: TextAlign.center,
                  style: Get.theme.textTheme.displayLarge?.copyWith(
                    color: Get.theme.primaryColor,
                  ),
                ).fadeIn(),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  tr(LocaleKeys.welcome_welcome_description),
                  textAlign: TextAlign.center,
                  style: Get.theme.textTheme.bodyMedium?.copyWith(
                    color: Get.theme.primaryColor,
                  ),
                ).fadeInLeft(),
                30.verticalSpace,
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.onboarding);
                  },
                  child: Text(
                    tr(LocaleKeys.core_get_started),
                  ),
                ).zoomIn()
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: AppSvgWidget(
              assetsUrl: 'assets/icons/welcome_wave.svg',
              color: Get.theme.primaryColor,
              width: double.maxFinite,
              height: 260,
            ).fadeInUp(),
          ),
        ],
      ),
    );
  }
}
