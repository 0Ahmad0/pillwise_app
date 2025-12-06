import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pillwise_app/app/core/constants/app_assets.dart';
import 'package:pillwise_app/app/core/local/storage.dart';
import 'package:pillwise_app/app/core/theme/app_colors.dart';
import 'package:pillwise_app/app/core/widgets/app_svg_widget.dart';
import 'package:pillwise_app/app/core/widgets/app_text_button_widget.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';
import 'package:pillwise_app/modules/home/presentation/widgets/medication_card_widget.dart';
import 'package:pillwise_app/modules/medication_details/presentation/controllers/medication_details_controller.dart';

import '../../../../app/core/widgets/app_padding_widget.dart';
import '../../../medication_details/presentation/screens/medication_details_screen.dart';

class DrugDetailsCardWidget extends GetView<MedicationDetailsController> {
  final Map<String, dynamic> drug;

  const DrugDetailsCardWidget({super.key, required this.drug});

  // 1. إضافة دالة مساعدة لتحديد ما إذا كانت اللغة عربية
  bool get isArabic => Get.locale?.languageCode == 'ar';

  // 2. دالة ترجمة شرطية للنصوص الثابتة
  String _translate(String english, String arabic) {
    return isArabic ? arabic : english;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Get.theme.copyWith(dividerColor: AppColors.transparent),
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              ListTile(
                dense: true,
                leading: AppSvgWidget(
                  assetsUrl: AppAssets.capsuleIcon,
                  color: Get.theme.primaryColor,
                  width: 26.w,
                  height: 26.w,
                ),
                title: Text(
                 controller.medicine?.tradeName?? drug["trade_name"] ?? "",
                  style: Get.textTheme.displayLarge?.copyWith(fontSize: 18.sp),
                ),
                subtitle: Text(
                  controller.medicine?.scientificName??drug["scientific_name"] ?? "",
                  style: Get.textTheme.bodyMedium,
                ),
              ),

              _buildTile(
                icon: Iconsax.document_text,
                // ⬅️ تم استخدام دالة الترجمة هنا
                title: _translate("General Information", "المعلومات العامة"),
                children: [
                  _info(_translate("Scientific Name", "الاسم العلمي"),
                      controller.medicine?.scientificName??drug["scientific_name"]),
                  _info(_translate("Strength", "التركيز"),
                      "${controller.medicine?.strength??drug["strength"]} ${controller.medicine?.strengthUnit??drug["strength_unit"]}"),
                  _info(_translate("Form", "الشكل الصيدلي"),
                      controller.medicine?.pharmaceuticalForm??drug["pharmaceutical_form"]),
                  _info(_translate("Route", "طريق الإعطاء"),
                      controller.medicine?.administrationRoute??drug["administration_route"]),
                  _info(_translate("Shelf Life", "مدة الصلاحية"),
                      "${controller.medicine?.shelfLife??drug["shelf_life"]} months"),
                  // ⬅️ تم استخدام حقل الشرط العربي مباشرة من البيانات
                  _info(_translate("Storage", "شروط التخزين"),
                      controller.medicine?.storageConditionArabic??drug["storage_condition_arabic"]),
                ],
              ),

              // --- PACKAGE DETAILS ---
              _buildTile(
                icon: Iconsax.box,
                title: _translate("Package Details", "تفاصيل العبوة"),
                children: [
                  _info(_translate("Package Type", "نوع العبوة"),
                      controller.medicine?.packageDetails?.packageTypes??drug["package_details"]["package_types"]),
                  _info(_translate("Size", "الحجم"),
                      controller.medicine?.packageDetails?.size??drug["package_details"]["size"]?.toString() ?? "—"),
                  _info(_translate("Package Size", "حجم العبوة"),
                      controller.medicine?.packageDetails?.packageSize?.toString()??drug["package_details"]["package_size"].toString()),
                ],
              ),

              // --- TECHNICAL DETAILS ---
              _buildTile(
                icon: Iconsax.setting_2,
                title: _translate("Technical Details", "التفاصيل الفنية"),
                children: [
                  _info(_translate("Product Type", "نوع المنتج"),
                      controller.medicine?.technicalDetails?.productType?? drug["technical_details"]["product_type"]),
                  _info(_translate("Drug Type", "نوع الدواء"),
                      controller.medicine?.technicalDetails?.drugType?? drug["technical_details"]["drug_type"]),
                  _info(_translate("ATC Code", "رمز ATC"),
                      controller.medicine?.technicalDetails?.atcCode1??   drug["technical_details"]["atc_code1"]),
                  _info(_translate("Legal Status", "الحالة القانونية"),
                      controller.medicine?.technicalDetails?.legalStatus?? drug["technical_details"]["legal_status"]),
                  _info(_translate("Authorization", "حالة التصريح"),
                      controller.medicine?.technicalDetails?.authorizationStatus??  drug["technical_details"]["authorization_status"]),
                ],
              ),

              // --- LOGISTICS ---
              _buildTile(
                icon: Iconsax.truck_fast,
                title: _translate("Logistics", "اللوجستيات"),
                children: [
                  _info(_translate("Marketing Company", "الشركة المسوّقة"),
                      controller.medicine?.logistics?.marketingCompany??   drug["logistics"]["marketing_company"]),
                  _info(_translate("Marketing Country", "دولة التسويق"),
                      controller.medicine?.logistics?.manufacturerCountry?? drug["logistics"]["marketing_country"]),
                  _info(_translate("Manufacturer", "الشركة المصنعة"),
                      controller.medicine?.logistics?.manufacturerName?? drug["logistics"]["manufacturer_name"]),
                  _info(_translate("Manufacturer Country", "دولة التصنيع"),
                      controller.medicine?.logistics?.manufacturerCountry??drug["logistics"]["manufacturer_country"]),
                  _info(_translate("Main Agent", "الوكيل الرئيسي"),
                      controller.medicine?.logistics?.mainAgent??drug["logistics"]["main_agent"]),
                  _info(_translate("Area", "منطقة التوزيع"),
                      controller.medicine?.logistics?.distributeArea??drug["logistics"]["distribute_area"]),
                ],
              ),

              // --- IDS ---
              _buildTile(
                icon: Iconsax.tag,
                title: _translate("Registration Info", "معلومات التسجيل"),
                children: [
                  _info(_translate("Register Number", "رقم التسجيل"),
                      controller.medicine?.ids?.registerNumber??drug["ids"]["register_number"]),
                  _info(_translate("Description Code", "رمز الوصف"),
                      controller.medicine?.ids?.descriptionCode?? drug["ids"]["description_code"]),
                  _info(_translate("Last Update", "آخر تحديث"),
                      controller.medicine?.ids?.lastUpdate?.toString()??drug["ids"]["last_update"].toString()),
                ],
              ),
            GetBuilder<MedicationDetailsController>(
                init: controller,
                builder: (controller){
                  if(!(controller.medicine?.userIsAdd(AppStorage.getUserStorage()?.uid??'')??false))
                   // return AppTextButtonWidget(
                   //    text: tr(LocaleKeys.core_add),
                   //    onPressed: () {
                   //      controller.showConditionDescriptionDialog();
                   //      // controller.addToInventory();
                   //      // controller.showReminderMedicationBottomSheet();
                   //    },
                   //    isFullWidth: true,
                   //  );
                    return AppTextButtonWidget(
                      text: tr(LocaleKeys.core_next_intake),
                      onPressed: () {

                        controller.showReminderMedicationBottomSheet();
                      },
                      isFullWidth: true,
                    );
                  else
                    return AppPaddingWidget(
                      child: AppTextButtonWidget(
                        text: tr(LocaleKeys.core_delete),
                        onPressed: () {
                          Get.defaultDialog(
                            title: tr(LocaleKeys.confirm_delete)??"Confirm Delete",
                            middleText:tr(LocaleKeys.delete_medication_question)?? "Are you sure you want to delete medication?",
                            textConfirm:tr(LocaleKeys.core_delete)?? "Delete",
                            textCancel:tr(LocaleKeys.core_cancel)?? "Cancel",
                            onConfirm: () async {

                              Get.close(1);
                              await   deleteFromInventory(controller.medicine!);

                            },
                          );

                        },
                        isFullWidth: true,
                      ),
                    );
                }),


            ],
          ),
        ),
      ),
    );
  }

  // TEMPLATE FOR EXPANSION TILE (بدون تعديل)
  Widget _buildTile({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return ExpansionTile(
      leading: Icon(
        icon,
      ),
      title: Text(
        title,
        style: Get.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      children: children,
    );
  }

  // TEMPLATE FOR INFO ROW (بدون تعديل)
  Widget _info(String label, String? value) {
    return ListTile(
      title: Text(label,
          style:
              Get.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
      subtitle: Text(value ?? "—"),
    );
  }
}
