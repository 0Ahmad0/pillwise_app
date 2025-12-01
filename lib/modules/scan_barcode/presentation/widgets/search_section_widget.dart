import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pillwise_app/app/core/widgets/app_text_filed_widget.dart';
import 'package:pillwise_app/app/routes/app_routes.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';

class SearchSectionWidget extends StatelessWidget {
  const SearchSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.verticalSpace,
        Text(
          tr(LocaleKeys.searchAndScan_search_text),
          style: Get.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp
          ),
        ),
        20.verticalSpace,
        AppTextFormFieldWidget(
          hintText: tr(LocaleKeys.searchAndScan_search_text_hint),
          prefixIcon: Iconsax.search_normal,
          readOnly: true,
          onTap: ()=> Get.toNamed(AppRoutes.search),
        ),
      ],
    );
  }
}
