import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/controllers/image_picker_controller.dart';
import 'package:pillwise_app/app/core/constants/app_assets.dart';
import 'package:pillwise_app/app/core/widgets/app_image_picker_bottom_sheet.dart';
import 'package:pillwise_app/app/core/widgets/app_svg_widget.dart';
import 'package:pillwise_app/app/extension/opacity_extension.dart';
import 'package:pillwise_app/app/routes/app_routes.dart';

import '../../../../app/core/models/medicine_model.dart';

class MedicationSearchWidget extends StatelessWidget {
  const MedicationSearchWidget(
      {super.key, required this.title, required this.subTitle, required this.item});

  final MedicineModel item ;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Get.toNamed(AppRoutes.medicationDetails,arguments: {"medicine":item}),
      child: Card(
        elevation: 0,
        child: Row(
          children: [
            10.horizontalSpace,
            Container(
              padding: EdgeInsets.all(6.sp),
              decoration: BoxDecoration(
                color: Get.theme.primaryColor.myOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r)
              ),
              child: AppSvgWidget(
                assetsUrl: AppAssets.capsuleIcon,
                color: Get.theme.primaryColor,
              ),
            ),
            Flexible(
              child: ListTile(
                trailing: Icon(Icons.keyboard_double_arrow_left),
                title: Text(
                  title,
                ),
                subtitle: Text(
                  subTitle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
