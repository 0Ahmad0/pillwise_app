import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/core/constants/app_constants.dart';
import 'package:pillwise_app/app/core/theme/app_colors.dart';
import 'package:pillwise_app/app/core/utils/app_validator.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import '../controllers/navbar_controller.dart';
import 'dart:ui' as ui;
class NavbarScreen extends GetView<NavbarController> {
  const NavbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: controller.screens,
        ),
      ),
      bottomNavigationBar: Obx(() {
        return Directionality(
          textDirection: ui.TextDirection.ltr,
          child: WaterDropNavBar(
            backgroundColor: Get.theme.colorScheme.surface,
            selectedIndex: controller.selectedIndex.value,
            onItemSelected: controller.changePage,
            waterDropColor: Get.theme.primaryColor,
            barItems: controller.items,
            bottomPadding: 12.h,
            inactiveIconColor: AppColors.greyColor,
            iconSize: 24.sp,
          ),
        );
      }),
    );
  }
}
