import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart'; // لإطلاق البريد الإلكتروني

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // التحقق من لغة العرض لتحديد محاذاة النص
    final isArabic = context.locale.languageCode == 'ar';

    return Scaffold(
      appBar: AppBar(
        title: Text('privacy_policy_title'.tr()),
        backgroundColor: Colors.indigo, // لون مميز لصفحة الخصوصية
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. المعلومات التي نجمعها
            _buildPrivacyTile(
              context,
              titleKey: 'info_collect_title',
              icon: Iconsax.safe_home,
              contentKey: 'info_collect_data',
            ),

            // 2. كيف نستخدم بياناتك
            _buildPrivacyTile(
              context,
              titleKey: 'how_we_use_data_title',
              icon: Iconsax.data2,
              contentKey: 'how_we_use_data',
            ),

            // 3. حماية البيانات
            _buildPrivacyTile(
              context,
              titleKey: 'data_protection_title',
              icon: Iconsax.security,
              contentKey: 'data_protection_measures',
            ),

            // 4. حقوقك
            _buildPrivacyTile(
              context,
              titleKey: 'your_rights_title',
              icon: Iconsax.user_octagon,
              contentKey: 'your_rights_data',
            ),

            const SizedBox(height: 15),

            // 5. التحليلات (Analytics) - نص عادي
            _buildSimpleTextSection(
              titleKey: 'analytics_title',
              icon: Iconsax.chart,
              contentKey: 'analytics_text',
            ),

            const SizedBox(height: 30),

            // 6. جهة اتصال الخصوصية
            _buildContactCard(context),
          ],
        ),
      ),
    );
  }

  // ويدجت لعرض الأقسام التي تحتوي على قوائم HTML
  Widget _buildPrivacyTile(
      BuildContext context, {
        required String titleKey,
        required IconData icon,
        required String contentKey,
      }) {
    final isArabic = context.locale.languageCode == 'ar';

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: ExpansionTile(
        initiallyExpanded: false,
        leading: Icon(icon, color: Colors.indigo),
        title: Text(
          titleKey.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            // ⬅️ استخدام FlutterHtml لعرض محتوى HTML
            child: Html(
              data: contentKey.tr(),
              style: {
                "body": Style(
                  fontSize: FontSize(15.0),
                  color: Colors.black87,
                  textAlign: isArabic ? TextAlign.right : TextAlign.left, // محاذاة شرطية
                ),
                "li": Style(
                  margin: Margins.symmetric(vertical: 4),
                )
              },
            ),
          ),
        ],
      ),
    );
  }

  // ويدجت لعرض الأقسام التي تحتوي على نص عادي
  Widget _buildSimpleTextSection({
    required String titleKey,
    required IconData icon,
    required String contentKey,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.indigo, size: 24),
            const SizedBox(width: 8),
            Text(
              titleKey.tr(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.indigo),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 5, right: 5),
          child: Text(
            contentKey.tr(),
            style: const TextStyle(fontSize: 15, color: Colors.black87, height: 1.4),
          ),
        ),
      ],
    );
  }

  // ويدجت خاص بجهة الاتصال للخصوصية
  Widget _buildContactCard(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: const Icon(Iconsax.profile_circle, color: Colors.redAccent),
        title: Text('privacy_contact_label'.tr(),
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: const Text('Norah.19nx@gmail.com', style: TextStyle(color: Colors.blue)),
        trailing: const Icon(Iconsax.arrow_right_3, color: Colors.redAccent),
        onTap: () async {
          final uri = Uri.parse('mailto:Norah.19nx@gmail.com');
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
      ),
    );
  }
}