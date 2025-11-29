import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/core/theme/app_colors.dart';

class BuildPrivacyTileWidget extends StatelessWidget {
  const BuildPrivacyTileWidget({
    super.key,
    required this.context,
    required this.titleKey,
    required this.icon,
    required this.contentKey,
     this.isExpanded = false,
  });

  final BuildContext context;
  final String titleKey;
  final IconData icon;
  final String contentKey;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Get.theme.copyWith(dividerColor: AppColors.transparent),
      child: ExpansionTile(
        initiallyExpanded: isExpanded,
        leading: Icon(icon,color: Get.theme.primaryColor,),
        title: Text(
          tr(titleKey),
          style: Get.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold
          ),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Html(
              data: tr(contentKey),
              style: {
                "ul": Style(padding: HtmlPaddings.zero),
                "li": Style(
                  margin: Margins.symmetric(vertical: 4.h),
                )
              },
            ),
          ),
        ],
      ),
    );
  }
}
