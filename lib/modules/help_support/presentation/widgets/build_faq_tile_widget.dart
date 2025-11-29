import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/core/theme/app_colors.dart';
import '../../../../app/core/widgets/app_padding_widget.dart';

class BuildFaqTileWidget extends StatelessWidget {
  const BuildFaqTileWidget({
    super.key,
    required this.context,
    required this.icon,
    required this.questionKey,
    required this.answerKey,
    this.isExpanded = false,
  });

  final BuildContext context;
  final IconData icon;
  final String questionKey;
  final String answerKey;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 6.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: Theme(
        data: Get.theme.copyWith(dividerColor: AppColors.transparent),
        child: ExpansionTile(
          initiallyExpanded: isExpanded,
          leading: Icon(icon),
          title: Text(
            tr(questionKey),
            style:
                Get.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          children: <Widget>[
            AppPaddingWidget(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
              child: Html(
                data: tr(answerKey),
                style: {
                  "ul": Style(
                      padding: HtmlPaddings.symmetric(
                    horizontal: 14.w,
                  )),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
