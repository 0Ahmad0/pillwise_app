import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/controllers/image_picker_controller.dart';
import 'package:pillwise_app/app/core/constants/app_constants.dart';
import 'package:pillwise_app/app/core/widgets/app_image_picker_bottom_sheet.dart';
import 'package:pillwise_app/app/extension/opacity_extension.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';

class BuildCurrentMedicationsWidget extends StatelessWidget {
  const BuildCurrentMedicationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.medical_services_outlined),
      trailing: Icon(Get.locale?.languageCode == AppConstants.en
          ? Icons.keyboard_double_arrow_right
          : Icons.keyboard_double_arrow_left),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: BorderSide(color: Get.theme.primaryColor, width: .5)),
      title: Text(
        tr(LocaleKeys.health_info_current_medications),
      ),
    );
  }
}
