import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_barcode_scanner_plus/flutter_barcode_scanner_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pillwise_app/app/controllers/image_picker_controller.dart';
import 'package:pillwise_app/app/core/constants/app_assets.dart';
import 'package:pillwise_app/app/core/widgets/app_button_widget.dart';
import 'package:pillwise_app/app/core/widgets/app_svg_widget.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';

import '../../../../app/core/local/storage.dart';
import '../../../../app/core/widgets/constants_widgets.dart';
import '../../../../app/routes/app_routes.dart';
import '../controllers/scan_barcode_controller.dart';

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
          onPressed: () async {
            // await  Get.put(ScanBarcodeController()).searchMedication("DRG_020");
            if(AppStorage.getUserStorage()?.healthInfo!=null) {
              String result = await FlutterBarcodeScanner.scanBarcode(
                '#ff6666',
                tr(LocaleKeys.core_cancel),
                true,
                ScanMode.BARCODE,
              );
              if (result != '-1') {

                await  Get.put(ScanBarcodeController()).searchMedication(result);
              }
              else {
                ConstantsWidgets.TOAST(null,textToast:tr(LocaleKeys.nothing_scanned)??"لم يقرأ اي شيء",state:false );
                // showInfoToast(
                //   message: LocaleKeys.you_didnt_scan_anything.tr,
                //   gravity: ToastGravity.TOP,
                // );
              }
            }

            else
            ConstantsWidgets.TOAST(null, title:tr(LocaleKeys.action_required)?? "اجراء مطلوب",textToast:  tr(LocaleKeys.home_medical_profile_is_incomplete), state: false);
          },
        ),
      ],
    );
  }
}
