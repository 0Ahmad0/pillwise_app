// مثال لصفحة 'اتصل بنا' - تستخدم الأيقونات وتنسيق جميل
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  // ويدجت مخصص لصف تفاصيل الاتصال
  Widget _buildContactRow(
      {required IconData icon,
        required String labelKey,
        required String value,
        required Color color,
        Function()? onTap}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(labelKey.tr(),
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value, style: TextStyle(color: Colors.grey.shade700)),
        trailing: onTap != null
            ? Icon(Iconsax.arrow_right_3, color: color.withOpacity(0.7))
            : null,
        onTap: onTap, // لتمكين النقر للاتصال أو الإرسال
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('contact_us_title'.tr()),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // نص الدعم العام
            Text('contact_support_text'.tr(),
                style: const TextStyle(fontSize: 16, height: 1.5)),
            const SizedBox(height: 20),

            // البريد الإلكتروني (يمكنك إضافة دالة لـ launchUrl عند النقر)
            _buildContactRow(
              icon: Iconsax.messages_3,
              labelKey: 'contact_support_text', // استخدام key مختلف هنا إذا كنت تحتاج
              value: 'Norah.19nx@gmail.com',
              color: Colors.blue.shade700,
              // onTap: () => launchUrl(Uri.parse('mailto:Norah.19nx@gmail.com')),
            ),

            // الهاتف (يمكنك إضافة دالة لـ launchUrl عند النقر)
            _buildContactRow(
              icon: Iconsax.call,
              labelKey: 'contact_phone_label',
              value: '+966 594044592',
              color: Colors.green,
              // onTap: () => launchUrl(Uri.parse('tel:+966594044592')),
            ),

            // ساعات العمل
            _buildContactRow(
              icon: Iconsax.clock,
              labelKey: 'contact_working_hours_label',
              value: 'contact_working_hours'.tr(),
              color: Colors.purple,
            ),

            const SizedBox(height: 30),
            const Divider(),

            // إخلاء المسؤولية الطبية
            Text('contact_disclaimer'.tr(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 14, fontStyle: FontStyle.italic, color: Colors.red)),
          ],
        ),
      ),
    );
  }
}