import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pillwise_app/app/core/constants/app_constants.dart';
import 'package:pillwise_app/app/core/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../generated/locale_keys.g.dart';

class BuildContactCardWidget extends StatelessWidget {
  const BuildContactCardWidget({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        leading: Icon(Iconsax.profile_circle, color: Get.theme.primaryColor),
        title: Text(
          tr(LocaleKeys.privacy_contact_label),
          style:
              Get.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(AppConstants.appEmail,
            style:
                Get.textTheme.bodyMedium?.copyWith(color: AppColors.greyColor)),
        trailing: Icon(Icons.keyboard_double_arrow_left,
            color: Get.theme.primaryColor),
        onTap: () => launchUrl(Uri.parse('mailto:${AppConstants.appEmail}')),
      ),
    );
  }
}
