// pages/health_info_advanced_page.dart
import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/controllers/image_picker_controller.dart';
import 'package:pillwise_app/app/core/theme/app_colors.dart';
import 'package:pillwise_app/app/core/widgets/app_app_bar_widget.dart';
import 'package:pillwise_app/app/core/widgets/app_button_widget.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';
import 'package:pillwise_app/modules/auth/presentation/screens/forget_password_screen.dart';
import 'package:pillwise_app/modules/auth/presentation/screens/login_screen.dart';
import 'package:pillwise_app/modules/health_information/presentation/controllers/health_information_controller.dart';
import 'package:pillwise_app/modules/health_information/presentation/widgets/build_breastfeeding_section_widget.dart';
import 'package:pillwise_app/modules/health_information/presentation/widgets/build_current_medications_widget.dart';
import 'package:pillwise_app/modules/health_information/presentation/widgets/build_date_of_birth_section.dart';
import 'package:pillwise_app/modules/health_information/presentation/widgets/build_gender_widget.dart';
import 'package:pillwise_app/modules/health_information/presentation/widgets/build_height_section_widget.dart';
import 'package:pillwise_app/modules/health_information/presentation/widgets/build_pregnant_section_widget.dart';
import 'package:pillwise_app/modules/health_information/presentation/widgets/build_weight_section_widget.dart';

class HealthInformationScreen extends GetView<HealthInformationController> {
  const HealthInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarWidget(
        title: tr(LocaleKeys.health_info_title_screen),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildGenderWidget(),
            Obx(() => controller.showFemaleOptions.value
                ? Container(
                    margin: EdgeInsets.only(top: 20.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border:
                            Border.all(color: AppColors.greyColor, width: .5)),
                    child: Column(
                      children: [
                        BuildPregnantSectionWidget(),
                        6.verticalSpace,
                        BuildBreastfeedingSectionWidget(),
                      ],
                    ),
                  ).zoomIn()
                : SizedBox.shrink()),
            20.verticalSpace,
            BuildDateOfBirthSection(),
            20.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: BuildHeightSectionWidget(),
                ),
                10.horizontalSpace,
                Expanded(
                  child: BuildWeightSectionWidget(),
                )
              ],
            ),
            20.verticalSpace,
            BuildCurrentMedicationsWidget(),
            20.verticalSpace,
            AppButtonWidget(
              text: tr(LocaleKeys.core_save_changes),
              onPressed:
                  controller.hasAllRequiredInfo ? controller.saveChanges : null,
            )
          ],
        ),
      ),
    );
  }
}
