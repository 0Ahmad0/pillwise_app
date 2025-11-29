// مثال لصفحة 'اتصل بنا' - تستخدم الأيقونات وتنسيق جميل
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pillwise_app/app/core/constants/app_constants.dart';
import 'package:pillwise_app/app/core/widgets/app_app_bar_widget.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/build_contact_row_widget.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarWidget(
        title: tr(LocaleKeys.contact_us_title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              tr(LocaleKeys.contact_support_text),
              style: Get.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            20.verticalSpace,

            // البريد الإلكتروني (يمكنك إضافة دالة لـ launchUrl عند النقر)
            BuildContactRowWidget(
              icon: Icons.alternate_email,
              labelKey: LocaleKeys.profile_email,
              // استخدام key مختلف هنا إذا كنت تحتاج
              value: AppConstants.appEmail,
              color: Colors.blueAccent,
              onTap: () => launchUrl(Uri.parse('mailto:${AppConstants.appEmail}')),
            ),

            // الهاتف (يمكنك إضافة دالة لـ launchUrl عند النقر)
            BuildContactRowWidget(
              icon: Iconsax.call,
              labelKey: LocaleKeys.contact_phone_label,
              value: AppConstants.appPhone,
              color: Colors.orangeAccent,
              onTap: () => launchUrl(Uri.parse('tel:${AppConstants.appPhone}')),
            ),

            // ساعات العمل
            BuildContactRowWidget(
              icon: Iconsax.clock,
              labelKey: LocaleKeys.contact_working_hours_label,
              value: tr(LocaleKeys.contact_working_hours),
              color: Colors.purpleAccent,
            ),
            20.verticalSpace,

            // إخلاء المسؤولية الطبية
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.help_outline),
                Flexible(
                  child: Text(tr(LocaleKeys.contact_disclaimer),
                      textAlign: TextAlign.center,
                      style: Get.textTheme.bodyMedium?.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Get.theme.primaryColor
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
