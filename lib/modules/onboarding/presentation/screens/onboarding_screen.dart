import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import '../widgets/onboarding_page_widget.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // --- 1. زر التخطي (Skip) ---
            _buildSkipButton(),

            // --- 2. الصفحات (PageView) ---
            PageView.builder(
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              itemCount: controller.onboardingPages.length,
              itemBuilder: (context, index) {
                return OnboardingPageWidget(
                  item: controller.onboardingPages[index],
                );
              },
            ),

            // --- 3. الأزرار السفلية (Dots & Buttons) ---
            _buildBottomControls(),
          ],
        ),
      ),
    );
  }

  // --- ويدجت زر التخطي ---
  Widget _buildSkipButton() {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: controller.skip,
        child: Text(
          "Skip",
          style: Get.textTheme.bodyMedium?.copyWith(
            color: Get.theme.primaryColor, // <-- استخدام لونك الأساسي
          ),
        ),
      ),
    );
  }

  // --- ويدجت الأزرار السفلية ---
  Widget _buildBottomControls() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // --- 1. زر "السابق" (Previous) ---
            Obx(() {
              // يظهر فقط إذا لم نكن في الصفحة الأولى
              return Visibility(
                visible: controller.currentPageIndex.value > 0,
                maintainSize: true, // يحافظ على حجمه (للحفاظ على التوسيط)
                maintainAnimation: true,
                maintainState: true,
                child: IconButton(
                  onPressed: controller.previousPage,
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              );
            }),

            // --- 2. الدوائر (Dots Indicator) ---
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.onboardingPages.length,
                    (index) => _buildDot(index), // استدعاء ويدجت النقطة
              ),
            ),

            // --- 3. زر "التالي" (Next) ---
            IconButton(
              onPressed: controller.nextPage,
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }

  // --- ويدجت النقطة (Dot) ---
  Widget _buildDot(int index) {
    // نستخدم Obx لمراقبة التغيير في الصفحة الحالية
    return Obx(() {
      bool isActive = controller.currentPageIndex.value == index;
      return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: 8.h,
        width: isActive ? 24.w : 8.w, // نقطة نشطة (عريضة) أو عادية
        decoration: BoxDecoration(
          color: isActive ? Get.theme.primaryColor : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(5.r), // <-- نصف قطر متجاوب
        ),
      );
    });
  }
}