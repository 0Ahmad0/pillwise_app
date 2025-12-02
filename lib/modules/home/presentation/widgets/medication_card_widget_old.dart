// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:pillwise_app/app/core/constants/app_assets.dart';
// import 'package:pillwise_app/app/core/widgets/app_svg_widget.dart';
// import 'package:pillwise_app/app/routes/app_routes.dart';
//
// import '../../../../app/core/theme/app_colors.dart';
// import '../../../../app/core/widgets/app_padding_widget.dart';
// import '../../../../app/core/widgets/app_text_button_widget.dart';
// import '../../../../generated/locale_keys.g.dart';
// import '../../../medication_details/presentation/screens/medication_details_screen.dart';
// import 'build_detail_row_widget.dart';
// import 'info_icon_widget.dart';
//
// class MedicationCardWidget extends StatelessWidget {
//   final Drug drug;
//
//   const MedicationCardWidget({super.key, required this.drug});
//
//   @override
//   Widget build(BuildContext context) {
//     final isOTC = drug.legalStatus == 'OTC';
//     return GestureDetector(
//       onTap: ()=> Get.toNamed(AppRoutes.medicationDetails),
//       child: Card(
//         margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
//         elevation: 0,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ListTile(
//               leading: AppSvgWidget(
//                 assetsUrl: AppAssets.capsuleIcon,
//                 color: Get.theme.primaryColor,
//               ),
//               title: Text(
//                 drug.tradeName,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 style: Get.textTheme.bodyMedium
//                     ?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.bold),
//               ),
//               subtitle: Text(
//                 drug.scientificName.split(',')[0],
//                 // عرض أول اسم علمي فقط للاختصار
//                 style: Get.textTheme.bodySmall?.copyWith(
//                     fontStyle: FontStyle.italic, color: AppColors.greyColor),
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               trailing: Container(
//                 alignment: Alignment.center,
//                 width: 24.w,
//                 height: 24.w,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                       color: isOTC ? AppColors.success : AppColors.warning,
//                       width: .5),
//                 ),
//                 child: Text(
//                   isOTC ? 'OTC' : 'Rx',
//                   style: Get.textTheme.bodySmall?.copyWith(
//                       color: isOTC ? AppColors.success : AppColors.warning,
//                       fontSize: 8.sp),
//                 ),
//               ),
//             ),
//             // --- Header: Name & Status ---,
//             const Divider(
//               height: 1,
//               thickness: .2,
//             ),
//             ListTile(
//               dense: true,
//               leading: Icon(
//                 Iconsax.clock,
//                 color: Get.theme.primaryColor,
//               ),
//               title: Text(
//                 tr(LocaleKeys.core_next_intake),
//                 style: Get.textTheme.bodyMedium
//                     ?.copyWith(fontWeight: FontWeight.bold),
//               ),
//               subtitle: Text(
//                 DateFormat.jm().format(DateTime.now()),
//                 style: Get.textTheme.bodyMedium,
//               ),
//             ),
//             // --- Body: Quick Info Icons ---
//             AppPaddingWidget(
//               padding: EdgeInsets.symmetric(
//                 vertical: 10.h,
//               ),
//               child: Wrap(
//                 runSpacing: 16.h,
//                 spacing: 20.w,
//                 crossAxisAlignment: WrapCrossAlignment.start,
//                 alignment: WrapAlignment.start,
//                 children: [
//                   InfoIconWidget(
//                     icon: Icons.medication_liquid_rounded,
//                     label: tr(LocaleKeys.medicationDetails_form),
//                     value: drug.form.split(' ')[0], // اختصار الشكل
//                   ),
//                   InfoIconWidget(
//                     icon: Icons.face,
//                     label: tr(LocaleKeys.medicationDetails_usage),
//                     value: drug.route.replaceAll(' use', ''),
//                   ),
//                   InfoIconWidget(
//                     icon: Icons.inventory_2_outlined,
//                     label: tr(LocaleKeys.medicationDetails_package),
//                     value: "${drug.packageSize}",
//                   ),
//                   InfoIconWidget(
//                     icon: Icons.thermostat,
//                     label: tr(LocaleKeys.medicationDetails_storage),
//                     value: "< 25°C", // اختصار للعرض
//                   ),
//                 ],
//               ),
//             ),
//             AppPaddingWidget(
//               child: AppTextButtonWidget(
//                 text: tr(LocaleKeys.core_delete),
//                 onPressed: () {},
//                 isFullWidth: true,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
