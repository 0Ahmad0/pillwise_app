import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/core/constants/app_assets.dart';
import 'package:pillwise_app/app/core/widgets/app_app_bar_widget.dart';
import 'package:pillwise_app/app/core/widgets/app_button_widget.dart';
import 'package:pillwise_app/app/core/widgets/app_dropdown_widget.dart';
import 'package:pillwise_app/app/core/widgets/app_padding_widget.dart';
import 'package:pillwise_app/app/core/widgets/app_svg_widget.dart';
import 'package:pillwise_app/app/core/widgets/app_text_button_widget.dart';
import 'package:pillwise_app/app/core/widgets/app_text_filed_widget.dart';
import 'package:pillwise_app/app/extension/opacity_extension.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';
import '../../../../app/controllers/image_picker_controller.dart';
import '../../../../app/core/theme/app_colors.dart';
import '../controllers/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarWidget(
        title: tr(LocaleKeys.profile_title_screen),
      ),
      body: AppPaddingWidget(
        child: SingleChildScrollView(
          child: Form(
            key: controller.profileFormKey,
            child: Column(
              children: [
                Obx(
                  () => Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 62.sp,
                        backgroundColor: Get.theme.colorScheme.surface,
                        backgroundImage: Get.find<ImagePickerController>()
                                    .selectedImage
                                    .value !=
                                null
                            ? FileImage(Get.find<ImagePickerController>()
                                .selectedImage
                                .value!)
                            : null,
                        child: Get.find<ImagePickerController>()
                                    .selectedImage
                                    .value ==
                                null
                            ? const Icon(
                                Icons.person,
                                color: AppColors.greyColor,
                              )
                            : null,
                      ),
                      PositionedDirectional(
                        bottom: -10,
                        end: 0,
                        child: IconButton.filled(
                          onPressed: () {
                            Get.find<ImagePickerController>()
                                .showImagePickerBottomSheet();
                          },
                          icon: Icon(
                            Icons.add_a_photo_outlined,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                30.verticalSpace,
                AppTextFormFieldWidget(
                  controller: controller.fullNameController,
                  hintText: tr(LocaleKeys.profile_full_name),
                  prefixIcon: Icons.person_outline,
                ),
                20.verticalSpace,
                AppTextFormFieldWidget(
                  controller: controller.usernameController,
                  hintText: tr(LocaleKeys.profile_nick_name),
                  prefixIcon: Icons.person_outline,
                ),
                20.verticalSpace,
                AppTextFormFieldWidget(
                  controller: controller.emailController,
                  hintText: tr(LocaleKeys.profile_email),
                  prefixIcon: Icons.email_outlined,
                ),
                20.verticalSpace,
                AppTextFormFieldWidget(
                  controller: controller.phoneController,
                  hintText: tr(LocaleKeys.profile_phone_number),
                  prefixIcon: Icons.phone_enabled_outlined,
                ),
                20.verticalSpace,
                AppDropdownButtonWidget<String>(
                  hintText: tr(LocaleKeys.profile_country),
                  onChanged: (String? value) {},
                  prefixIcon: Icons.flag_outlined,
                  items: controller.countries
                      .map(
                        (country) => DropdownMenuItem<String>(
                          value: country,
                          child: Text(country),
                        ),
                      )
                      .toList(),
                ),
                40.verticalSpace,
                AppButtonWidget(
                  text: tr(LocaleKeys.core_save_changes),
                  onPressed: () {},
                ),
                10.verticalSpace,
                AppTextButtonWidget(
                  isFullWidth: true,
                  backGroundColor: Get.theme.primaryColor.myOpacity(.075),
                  text: tr(LocaleKeys.profile_delete_account),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
