import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart'; // ⬅️ EasyLocalization
import 'package:flutter_html/flutter_html.dart'; // ⬅️ لعرض HTML
import 'package:iconsax/iconsax.dart'; // ⬅️ أيقونات جميلة

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ⬅️ استخدام context.tr() للحصول على النص المترجم
    return Scaffold(
      appBar: AppBar(
        title: Text('help_support_title'.tr()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ⬅️ ويدجت عنوان وتعريف
            _buildSectionHeader(
              title: 'help_support_title'.tr(),
              icon: Iconsax.support,
            ),

            // ⬅️ قائمة الأسئلة الشائعة (FAQ)
            _buildFaqTile(
              context,
              icon: Iconsax.add_square,
              questionKey: 'how_to_add_medication_q',
              answerKey: 'how_to_add_medication_a',
            ),
            _buildFaqTile(
              context,
              icon: Iconsax.scan,
              questionKey: 'how_scan_works_q',
              answerKey: 'how_scan_works_a',
            ),
            _buildFaqTile(
              context,
              icon: Iconsax.flash_slash,
              questionKey: 'medication_not_scan_q',
              answerKey: 'medication_not_scan_a',
            ),
            _buildFaqTile(
              context,
              icon: Iconsax.search_normal_1,
              questionKey: 'medication_not_found_q',
              answerKey: 'medication_not_found_a',
            ),
            _buildFaqTile(
              context,
              icon: Iconsax.camera,
              questionKey: 'camera_wont_open_q',
              answerKey: 'camera_wont_open_a',
            ),
            _buildFaqTile(
              context,
              icon: Iconsax.trash,
              questionKey: 'how_to_delete_medication_q',
              answerKey: 'how_to_delete_medication_a',
            ),
            _buildFaqTile(
              context,
              icon: Iconsax.save_2,
              questionKey: 'app_not_saving_q',
              answerKey: 'app_not_saving_a',
            ),
          ],
        ),
      ),
    );
  }

  // ويدجت مخصص لعرض عنوان القسم
  Widget _buildSectionHeader({required String title, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 20.0),
      child: Row(
        children: [
          Icon(icon, size: 30, color: Colors.teal),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // ⬅️ ويدجت مخصص لأسئلة الـ FAQ (باستخدام ExpansionTile لجمالية التصميم)
  Widget _buildFaqTile(
      BuildContext context, {
        required IconData icon,
        required String questionKey,
        required String answerKey,
      }) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(
          questionKey.tr(), // ⬅️ السؤال مترجم
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            // ⬅️ استخدام FlutterHtml لعرض الإجابة مع تنسيق HTML (القوائم النقطية)
            child: Html(
              data: answerKey.tr(), // ⬅️ الإجابة مترجمة وفيها وسم HTML
              style: {
                "body": Style(
                  fontSize: FontSize(15.0),
                  color: Colors.black54,
                  textAlign: context.locale.languageCode == 'ar'
                      ? TextAlign.right
                      : TextAlign.left, // محاذاة النص حسب اللغة
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}