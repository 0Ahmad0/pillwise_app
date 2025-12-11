import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/core/utils/app_validator.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';
import 'package:pillwise_app/modules/profile/presentation/controllers/profile_controller.dart';
import 'package:pillwise_app/modules/welcome/presentation/screens/welcome_screen.dart';

import '../../../../app/core/constants/app_constants.dart';
import '../../../../app/core/local/storage.dart';
import '../../../../app/core/models/user_model.dart';
import '../../../../app/core/widgets/constants_widgets.dart';
import '../../../../app/routes/app_routes.dart';

class SettingsController extends GetxController {

  final RxBool notificationsEnabled = true.obs;
  final Rx<Locale> locale = Get.deviceLocale!.obs;
  final Rx<ThemeMode> themeMode = ThemeMode.system.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Future<void> onReady() async {
    await AppStorage.storageRead(
        key: AppConstants.NOTIFICATION_ENABLED).then((value)
    =>notificationsEnabled.value= value??true);

    await AppStorage.storageRead(
        key: AppConstants.IS_DARK_THEME).then((value) {
          if(value!=null){
            ThemeMode newThemeMode = value ? ThemeMode.dark : ThemeMode.light;
            themeMode.value=newThemeMode;
          }

    });

    super.onReady();
  }
  Future<void> toggleNotifications(bool value) async {
    notificationsEnabled.value = value;
    await  AppStorage.storageWrite(
        key: AppConstants.NOTIFICATION_ENABLED, value: notificationsEnabled.value);
    Get.snackbar("Notifications", "Notifications ${value ? 'Enabled' : 'Disabled'}");
  }
  // --- دوال تغيير اللغة ---
  void changeLanguage(String languageCode,BuildContext context) {
    if (languageCode == locale.value.languageCode) return; // لا تغيير

    // 1. تحديث واجهة المستخدم (GetX)
    Locale newLocale = Locale(languageCode);
    Get.updateLocale(newLocale);
    context.setLocale(newLocale);
    locale.value = newLocale; // تحديث المتغير التفاعلي

    // 2. حفظ الاختيار
  }

  // --- دوال تغيير الثيم ---
  Future<void> changeTheme() async {
    // 1. التحقق من السطوع "الفعلي" (حتى لو كان system)
    bool isCurrentlyDark = Get.isDarkMode;

    // 2. تحديد الوضع الجديد (التبديل)
    ThemeMode newThemeMode = isCurrentlyDark ? ThemeMode.light : ThemeMode.dark;

    // (لا حاجة للتحقق من التكرار، GetX يعالج ذلك)

    // 3. تحديث واجهة المستخدم (GetX)
    Get.changeThemeMode(newThemeMode);



    themeMode.value = newThemeMode; // تحديث المتغير التفاعلي
    // 4. حفظ الاختيار
    // bool isDark = (newThemeMode == ThemeMode.dark);
    // _storageService.saveTheme(isDark);
    update();
    await AppStorage.storageWrite(
        key: AppConstants.IS_DARK_THEME, value:!isCurrentlyDark );
    // AppStorage.storageRead(
    //     key: AppConstants.IS_DARK_THEME).then((value)=>print( value ));
  }

  void logout() {
    Get.defaultDialog(
      title: tr(LocaleKeys.confirm_logout)??"Confirm Logout",
      middleText: tr(LocaleKeys.logout_message)??"Are you sure you want to logout?",
      textConfirm:  tr(LocaleKeys.logout)??"Logout",
      textCancel:  tr(LocaleKeys.core_cancel)??"Cancel",
      onConfirm: () async {
        await processLogout();

      },
    );
  }
  Future<void> processLogout( {bool deleteFromAuth = false}) async {
    ConstantsWidgets.showLoading();
    await auth.signOut().then((value) async {
      if (deleteFromAuth) {
        auth.currentUser?.delete();
      }
    });
    await AppStorage.depose();

    // Get.find<ProfileController>().currentUser.value=null;
    ConstantsWidgets.closeDialog();
    Get.offAllNamed(AppRoutes.login);
  }


}