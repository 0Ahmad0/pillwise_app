// widgets/image_picker_bottom_sheet.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/core/widgets/app_button_widget.dart';
import 'package:pillwise_app/app/core/widgets/app_padding_widget.dart';
import 'package:pillwise_app/app/core/widgets/app_text_button_widget.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';
import 'package:pillwise_app/modules/profile/presentation/widgets/build_option_item_image_widget.dart';

import '../../controllers/image_picker_controller.dart';

class ImagePickerBottomSheet extends StatelessWidget {
  final ImagePickerController controller = Get.find<ImagePickerController>();

  ImagePickerBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            tr(LocaleKeys.image_picker_choose_image),
            style: Get.textTheme.labelLarge,
          ),
          20.verticalSpace,
          BuildOptionItemImageWidget(
            icon: Icons.photo_library,
            title: tr(LocaleKeys.image_picker_gallery),
            onTap: controller.pickFromGallery,
          ),

          // زر الكاميرا
          BuildOptionItemImageWidget(
            icon: Icons.camera_alt,
            title: tr(LocaleKeys.image_picker_camera),
            onTap: controller.pickFromCamera,
          ),

          // زر الحذف (يظهر فقط إذا كانت هناك صورة مختارة)
          Obx(() => controller.selectedImage.value != null
              ? BuildOptionItemImageWidget(
                  icon: Icons.delete,
                  title: tr(LocaleKeys.image_picker_delete),
                  color: Get.theme.colorScheme.error,
                  onTap: controller.deleteImage,
                )
              : const SizedBox.shrink()),

          AppPaddingWidget(
            child: AppButtonWidget(
                text: tr(LocaleKeys.core_cancel), onPressed: () => Get.back()),
          ),
        ],
      ),
    );
  }
}
