import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/core/constants/app_assets.dart';
import '../../../../app/routes/app_routes.dart';
import '../../data/models/onboarding_item_model.dart';

class OnboardingController extends GetxController {
  // 1. تعريف PageController للتحكم بالـ PageView
  late final PageController pageController;

  // 2. متغير لمراقبة رقم الصفحة الحالية
  final RxInt currentPageIndex = 0.obs;

  // 3. التحقق هل نحن في الصفحة الأخيرة؟
  bool get isLastPage => currentPageIndex.value == (onboardingPages.length - 1);

  // 4. قائمة بيانات الصفحات (باستخدام الموديل)
  final List<OnboardingItem> onboardingPages = [
    OnboardingItem(
      lottieAsset: AppAssets.calendarAnimation, // TODO: غيّر هذا للمسار الصحيح
      title: "Smart medication reminders",
      subtitle: "لا تفوّت جرعة بعد اليوم. احصل على تنبيهات دقيقة ومباشرة لمواعيد دوائك وابقَ على اطلاع دائم بجدولك الصحي.",
    ),
    OnboardingItem(
      lottieAsset: AppAssets.scanDrugAnimation, // TODO: غيّر هذا للمسار الصحيح
      title: "Easy participation scanning",
      subtitle: "انضم للدراسات أو سجل حضورك الصحي بسهولة. فقط امسح الـ QR كود وستكون جاهزاً للانطلاق في ثوانٍ.",
    ),
    OnboardingItem(
      lottieAsset: AppAssets.healthAnalysisAnimation, // TODO: غيّر هذا للمسار الصحيح
      title: "Personalised health insights",
      subtitle: "افهم صحتك بشكل أعمق. استقبل نصائح وإحصاءات مخصصة بناءً على بياناتك ومدى تقدمك اليومي.",
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    // 5. تهيئة الـ PageController عند بدء تشغيل الكونترولر
    pageController = PageController();
  }

  @override
  void onClose() {
    // 6. التخلص من الـ PageController عند إغلاق الشاشة
    pageController.dispose();
    super.onClose();
  }

  /// 7. دالة للانتقال للصفحة التالية
  void nextPage() {
    if (isLastPage) {
      // إذا كانت الصفحة الأخيرة، اذهب لصفحة الدخول
      goToLogin();
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  /// 8. دالة للانتقال للصفحة السابقة
  void previousPage() {
    if (currentPageIndex.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  /// 9. دالة لتخطي كل الصفحات
  void skip() {
    goToLogin();
  }

  /// 10. دالة الذهاب لصفحة الدخول (مع إغلاق شاشة الـ Onboarding)
  void goToLogin() {
    // TODO: يجب إضافة كود لحفظ أن المستخدم "شاهد" هذه الشاشة
    // (مثال: Get.find<StorageService>().write('seenOnboarding', true))
    Get.offAllNamed(AppRoutes.login); // اذهب للدخول وألغِ كل الصفحات السابقة
  }

  /// 11. دالة يتم استدعاؤها عند تغيير الصفحة
  void onPageChanged(int index) {
    currentPageIndex.value = index;
  }
}