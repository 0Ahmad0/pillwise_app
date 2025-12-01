import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pillwise_app/app/controllers/image_picker_controller.dart';
import 'package:pillwise_app/app/core/widgets/app_app_bar_widget.dart';
import 'package:pillwise_app/app/core/widgets/app_padding_widget.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';
import '../../../../app/core/widgets/app_text_filed_widget.dart';
import '../controllers/search_controller.dart';
import '../widgets/medication_search_widget.dart';

class SearchScreen extends GetView<SearchAppController> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            surfaceTintColor: Get.theme.scaffoldBackgroundColor,
            backgroundColor: Get.theme.cardColor,
            primary: true,
            snap: true,
            floating: true,
            toolbarHeight: 60.h,
            title: AppTextFormFieldWidget(
              hintText: tr(LocaleKeys.searchAndScan_search_text_hint),
              prefixIcon: Iconsax.search_normal,
              textInputAction: TextInputAction.search,
            ),
            leadingWidth: 20.w,
          ),
          SliverToBoxAdapter(
            child: 8.verticalSpace,
          ),
          SliverList.builder(
            itemCount: 100,
            itemBuilder: (context,index)=> MedicationSearchWidget(
              title: 'Title$index',
              subTitle: 'SubTitle'*index,
            ),
          )
        ],
      ),
    );
  }
}
