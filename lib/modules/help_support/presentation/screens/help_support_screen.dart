import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart'; // ⬅️ EasyLocalization
import 'package:flutter_html/flutter_html.dart'; // ⬅️ لعرض HTML
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pillwise_app/app/controllers/image_picker_controller.dart';
import 'package:pillwise_app/app/core/theme/app_colors.dart';
import 'package:pillwise_app/app/core/widgets/app_app_bar_widget.dart';
import 'package:pillwise_app/app/core/widgets/app_padding_widget.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';

import '../widgets/build_faq_tile_widget.dart';
import '../widgets/build_section_header_widget.dart'; // ⬅️ أيقونات جميلة

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ⬅️ استخدام context.tr() للحصول على النص المترجم
    return Scaffold(
      appBar: AppAppBarWidget(
        title: tr(LocaleKeys.help_support_title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildSectionHeaderWidget(title: tr(LocaleKeys.help_support_title), icon: Iconsax.support),
            BuildFaqTileWidget(context: context, icon: Iconsax.add_square, isExpanded:true,questionKey: LocaleKeys.how_to_add_medication_q, answerKey: LocaleKeys.how_to_add_medication_a),
            BuildFaqTileWidget(context: context, icon: Iconsax.scan, questionKey: LocaleKeys.how_scan_works_q, answerKey: LocaleKeys.how_scan_works_a),
            BuildFaqTileWidget(context: context, icon: Iconsax.flash_slash, questionKey: LocaleKeys.medication_not_scan_q, answerKey: LocaleKeys.medication_not_scan_a),
            BuildFaqTileWidget(context: context, icon: Iconsax.search_normal_1, questionKey: LocaleKeys.medication_not_found_q, answerKey: LocaleKeys.medication_not_found_a),
            BuildFaqTileWidget(context: context, icon: Iconsax.camera, questionKey: LocaleKeys.camera_wont_open_q, answerKey: LocaleKeys.camera_wont_open_a),
            BuildFaqTileWidget(context: context, icon: Iconsax.trash, questionKey: LocaleKeys.how_to_delete_medication_q, answerKey: LocaleKeys.how_to_delete_medication_a),
            BuildFaqTileWidget(context: context, icon: Iconsax.save_2, questionKey: LocaleKeys.app_not_saving_q, answerKey: LocaleKeys.app_not_saving_a),
          ],
        ),
      ),
    );
  }

}


