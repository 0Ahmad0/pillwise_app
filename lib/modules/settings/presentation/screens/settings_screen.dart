import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/core/theme/app_theme.dart';
import 'package:pillwise_app/app/core/widgets/app_scaffold_widget.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';
import 'package:pillwise_app/modules/settings/presentation/widgets/language_toggle_widget.dart';
import '../../../../app/controllers/image_picker_controller.dart';
import '../../../../app/core/local/storage.dart';
import '../../../../app/core/models/user_model.dart';
import '../../../../app/routes/app_routes.dart';
import '../../../profile/presentation/controllers/profile_controller.dart';
import '../controllers/settings_controller.dart';
import '../widgets/settings_group_widget.dart';
import '../widgets/settings_item_widget.dart';
import '../widgets/theme_toggle_widget.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return AppScaffoldWidget(
      // <-- استخدام الـ Scaffold المخصص (يحتوي على AppPadding)
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
            GetBuilder<ProfileController>(
            init: Get.put(ProfileController()),
              builder: (controller){
                UserModel? currentUser= AppStorage.getUserStorage();
              return  Row(
                children: [
                  CircleAvatar(
                    radius: 40.sp,
                    backgroundImage:
                    (currentUser?.photoUrl?.isNotEmpty??false)?
                    // (controller.currentUser.value?.photoUrl?.isNotEmpty??false)?
                    NetworkImage(   currentUser?.photoUrl??'')
                    // NetworkImage(   controller.currentUser.value?.photoUrl??'')
                    //     :null,
                    // NetworkImage('https://tse1.mm.bing.net/th/id/OIP.jhuU6q3Ob4zhSMl1gxJmbQHaE7?pid=ImgDet&w=184&h=122&c=7&dpr=1.3&o=7&rm=3'),
                    :Get.find<ImagePickerController>()
                        .selectedImage
                        .value !=
                        null
                        ? FileImage(Get.find<ImagePickerController>()
                        .selectedImage
                        .value!)
                        : null
                  ),
                  20.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentUser?.name??
                          // controller.currentUser.value?.name??
                              'Maimounah Alharthi',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Get.textTheme.displayLarge?.copyWith(
                              fontSize: 22.sp
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          currentUser?.email??
                          // controller.currentUser.value?.email??
                              'Maimounah.alh97@gmail.com',
                          style: Get.textTheme.bodySmall,
                        )
                      ],
                    ),
                  )
                ],
              );
              }
               ),
                20.verticalSpace,
                SettingsGroupWidget(
                  items: [
                    SettingsItemWidget(
                      titleKey: tr(LocaleKeys.settings_settings_editProfile),
                      icon: Icons.person_outline,
                      onTap: () {
                         Get.toNamed(AppRoutes.profile);
                      },
                    ),
                    SettingsItemWidget(
                      titleKey: tr(LocaleKeys.settings_settings_healthInfo),
                      icon: Icons.medical_services_outlined,

                      onTap: () {
                         Get.toNamed(AppRoutes.healthInformation);
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
                      onTap: () {},
                      // لا نحتاج onTap لأن الـ Switch سيتعامل مع الضغط
                      trailing: Obx(() {
                        // <-- مراقبة التغيير
                        return Switch(
                          value: controller.notificationsEnabled.value,
                          onChanged: controller.toggleNotifications,
                        );
                      }),
                    ),
                    SettingsItemWidget(
                      titleKey: tr(LocaleKeys.settings_settings_theme),
                      icon: Icons.brightness_6_outlined,
                      onTap: controller.changeTheme,
                      trailing: ThemeToggleWidget(),
                    ),
                    SettingsItemWidget(
                      titleKey: tr(LocaleKeys.settings_settings_language),
                      icon: Icons.translate,
                      onTap: () {
                        final String currentCode =
                            controller.locale.value.languageCode;

                        // تحديد الكود الجديد (التبديل بين عربي وانكليزي)
                        final String newCode =
                            (currentCode == 'ar') ? 'en' : 'ar';

                        // استدعاء الكونترولر
                        controller.changeLanguage(newCode, context);
                      },
                      trailing: LanguageToggleWidget(
                        
                      ),
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
                      onTap: () {
                        Get.toNamed(AppRoutes.helpAndSupport);
                      },
                    ),
                    SettingsItemWidget(
                      titleKey: tr(LocaleKeys.settings_settings_contact),
                      icon: Icons.support_agent_outlined,
                      onTap: () {
                        Get.toNamed(AppRoutes.contactUs);
                      },
                    ),
                    SettingsItemWidget(
                      titleKey: tr(LocaleKeys.settings_settings_privacy),
                      icon: Icons.lock_outline,
                      onTap: () {
                        Get.toNamed(AppRoutes.privacyPolicy);
                      },
                    ),
                    SettingsItemWidget(
                      titleKey: tr(LocaleKeys.settings_settings_logout),
                      icon: Icons.logout,
                      onTap: controller.logout,
                      // <-- استدعاء دالة الخروج
                      color: Colors.red,
                      // <-- لون مميز
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
