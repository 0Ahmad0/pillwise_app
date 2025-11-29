import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pillwise_app/app/controllers/image_picker_controller.dart';
import 'package:pillwise_app/app/core/theme/app_colors.dart';
import 'package:pillwise_app/app/core/widgets/app_app_bar_widget.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/build_contact_card_widget.dart';
import '../widgets/build_privacy_tile_widget.dart';
import '../widgets/build_simple_text_section_widget.dart'; // لإطلاق البريد الإلكتروني

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarWidget(
        title: tr(LocaleKeys.privacy_policy_title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 0,
              child: Column(
                children: [
                  BuildPrivacyTileWidget(
                      isExpanded: true,
                      context: context,
                      titleKey: LocaleKeys.info_collect_title,
                      icon: Iconsax.info_circle,
                      contentKey: LocaleKeys.info_collect_data),

                  // 2. كيف نستخدم بياناتك
                  BuildPrivacyTileWidget(
                      context: context,
                      titleKey: LocaleKeys.how_we_use_data_title,
                      icon: Iconsax.danger,
                      contentKey: LocaleKeys.how_we_use_data),

                  // 3. حماية البيانات
                  BuildPrivacyTileWidget(
                      context: context,
                      titleKey: LocaleKeys.data_protection_title,
                      icon: Iconsax.security,
                      contentKey: LocaleKeys.data_protection_measures),

                  // 4. حقوقك
                  BuildPrivacyTileWidget(
                      context: context,
                      titleKey: LocaleKeys.your_rights_title,
                      icon: Iconsax.user_octagon,
                      contentKey: LocaleKeys.your_rights_data),
                ],
              ),
            ),

            10.verticalSpace,

            // 5. التحليلات (Analytics) - نص عادي
            const BuildSimpleTextSectionWidget(
                titleKey: LocaleKeys.analytics_title,
                icon: Iconsax.chart,
                contentKey: LocaleKeys.analytics_text),

            10.verticalSpace,
            BuildContactCardWidget(context: context),
          ],
        ),
      ),
    );
  }
}
