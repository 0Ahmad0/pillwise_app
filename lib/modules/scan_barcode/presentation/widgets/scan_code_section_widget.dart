import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pillwise_app/app/controllers/image_picker_controller.dart';
import 'package:pillwise_app/app/core/constants/app_assets.dart';
import 'package:pillwise_app/app/core/widgets/app_button_widget.dart';
import 'package:pillwise_app/app/core/widgets/app_svg_widget.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';

class ScanCodeSectionWidget extends StatelessWidget {
  const ScanCodeSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        40.verticalSpace,
        Text(
          tr(LocaleKeys.searchAndScan_search_desc),
          style: Get.textTheme.bodyLarge?.copyWith(
            fontSize: 18.sp
          ),
          textAlign: TextAlign.center,
        ),
        30.verticalSpace,
        AspectRatio(
          aspectRatio: 1.3,
          child: AppSvgWidget(
            assetsUrl: AppAssets.swirlyArrowIcon,
            color: Get.theme.primaryColor,
          ),
        ),
        30.verticalSpace,
        AppButtonWidget(
          text: tr(LocaleKeys.searchAndScan_scan),
          icon: Icon(Iconsax.scan_barcode),
          onPressed: () {},
        ),
      ],
    );
  }
}
