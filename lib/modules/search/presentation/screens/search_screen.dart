import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pillwise_app/app/controllers/image_picker_controller.dart';
import 'package:pillwise_app/app/core/widgets/app_app_bar_widget.dart';
import 'package:pillwise_app/app/core/widgets/app_padding_widget.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';
import '../../../../app/core/models/medicine_model.dart';
import '../../../../app/core/widgets/app_text_filed_widget.dart';
import '../../../../app/core/widgets/constants_widgets.dart';
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
              onChanged: (value)=>    controller.filterMedicines(term: value),
            ),
            leadingWidth: 20.w,
          ),
          SliverToBoxAdapter(
            child: 8.verticalSpace,
          ),
      SliverToBoxAdapter(
        child: StreamBuilder<QuerySnapshot>(
          stream: controller.getMedicines,
          builder: (context, snapshot) {

            if (snapshot.connectionState == ConnectionState.waiting) {
              return ConstantsWidgets.circularProgress();
            }

            if (snapshot.hasError) {
              return Text("Error");
            }

            if (!snapshot.hasData) {
              return Text("Empty data");
            }

            controller.medicines.items.clear();
            if (snapshot.data!.docs.isNotEmpty) {
              controller.medicines.items =
                  Medicines.fromJson(snapshot.data!.docs).items;
            }


            controller.filterMedicines(
                term: controller.searchController.value.text);

            return GetBuilder<SearchAppController>(
              init: controller,
              builder: (c) {
                if (c.medicinesWithFilter.items.isEmpty) {
                  return Text("No Medicines Yet");
                }

                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: c.medicinesWithFilter.items.length,
                  itemBuilder: (context, index) {
                    final item = c.medicinesWithFilter.items[index];

                    return MedicationSearchWidget(
                      title: item.tradeName ?? "",
                      subTitle: item.scientificName ?? "",
                      item: item,
                    );
                  },
                );
              },
            );
          },
        ),
      ),


          // SliverList.builder(
          //   itemCount: 100,
          //   itemBuilder: (context,index)=> MedicationSearchWidget(
          //     title: 'Title$index',
          //     subTitle: 'SubTitle'*index,
          //   ),
          // )
        ],
      ),
    );
  }
}
