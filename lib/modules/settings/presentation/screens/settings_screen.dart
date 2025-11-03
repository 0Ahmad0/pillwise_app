import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/core/theme/app_theme.dart';
import 'package:pillwise_app/app/core/widgets/app_scaffold_widget.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';
import '../controllers/settings_controller.dart';
import '../widgets/settings_group_widget.dart';
import '../widgets/settings_item_widget.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget( // <-- استخدام الـ Scaffold المخصص (يحتوي على AppPadding)
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(radius: 50.sp,),
                20.verticalSpace,
                SettingsGroupWidget(
                  items: [
                    SettingsItemWidget(
                      titleKey: tr(LocaleKeys.settings_settings_editProfile),
                      icon: Icons.person_outline,
                      onTap: () {
                        // TODO: Get.toNamed(AppRoutes.EDIT_PROFILE);
                      },
                    ),
                    SettingsItemWidget(
                      titleKey: tr(LocaleKeys.settings_settings_healthInfo),
                      icon: Icons.medical_services_outlined,
                      onTap: () {
                        // TODO: Get.toNamed(AppRoutes.HEALTH_INFO);
                      },
                    ),
                  ],
                ),

                20.verticalSpace, // مسافة

                // --- المجموعة الثانية: التطبيق ---
                SettingsGroupWidget(
                  items: [
                    SettingsItemWidget(
                      titleKey: tr(LocaleKeys.settings_settings_notifications),
                      icon: Icons.notifications_outlined,
                      onTap: () {}, // لا نحتاج onTap لأن الـ Switch سيتعامل مع الضغط
                      trailing: Obx(() { // <-- مراقبة التغيير
                        return Switch(
                          value: controller.notificationsEnabled.value,
                          onChanged: controller.toggleNotifications,
                        );
                      }),
                    ),
                    SettingsItemWidget(
                      titleKey: tr(LocaleKeys.settings_settings_theme),
                      icon: Icons.brightness_6_outlined,
                      onTap: (){
                        // ToDO : Fix It
                        controller.changeTheme(
                          controller.themeMode.value == ThemeMode.dark?ThemeMode.light:ThemeMode.dark
                        );
                      },
                      trailing: Obx(() { // <-- مراقبة التغيير
                        return Text(
                          controller.themeMode.value == ThemeMode.dark
                              ? tr(LocaleKeys.settings_settings_darkMode)
                              : tr(LocaleKeys.settings_settings_lightMode),
                          style: Get.textTheme.bodySmall,
                        );
                      }),
                    ),
                  ],
                ),

                20.verticalSpace, // مسافة

                // --- المجموعة الثالثة: الدعم ---
                SettingsGroupWidget(
                  items: [
                    SettingsItemWidget(
                      titleKey: tr(LocaleKeys.settings_settings_help),
                      icon: Icons.help_outline,
                      onTap: () { /* ... */ },
                    ),
                    SettingsItemWidget(
                      titleKey: tr(LocaleKeys.settings_settings_contact),
                      icon: Icons.support_agent_outlined,
                      onTap: () { /* ... */ },
                    ),
                    SettingsItemWidget(
                      titleKey: tr(LocaleKeys.settings_settings_privacy),
                      icon: Icons.lock_outline,
                      onTap: () { /* ... */ },
                    ),
                    SettingsItemWidget(
                      titleKey: tr(LocaleKeys.settings_settings_logout),
                      icon: Icons.logout,
                      onTap: controller.logout, // <-- استدعاء دالة الخروج
                      color: Colors.red, // <-- لون مميز
                      trailing: const SizedBox.shrink(), // <-- إخفاء السهم
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}