// pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/controllers/image_picker_controller.dart';
import 'package:pillwise_app/app/core/constants/app_assets.dart';
import 'package:pillwise_app/app/core/theme/app_colors.dart';
import 'package:pillwise_app/app/core/widgets/app_app_bar_widget.dart';
import 'package:pillwise_app/app/core/widgets/app_image_picker_bottom_sheet.dart';
import 'package:pillwise_app/app/core/widgets/app_svg_widget.dart';
import 'package:pillwise_app/app/extension/opacity_extension.dart';
import 'package:pillwise_app/app/routes/app_routes.dart';
import 'package:pillwise_app/modules/home/presentation/widgets/empty_drugs_widget.dart';
import 'package:pillwise_app/modules/home/presentation/widgets/welcome_section_widget.dart';
import '../../data/models/medication_model.dart';
import '../controllers/home_controller.dart';
import '../widgets/drug_details_card_widget.dart';
import '../widgets/incomplete_profile_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarWidget(
        title: controller.currentTime.value,
        showBackButton: false,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: WelcomeSectionWidget(),
          ),
          SliverList.builder(
            itemCount: 3,
            itemBuilder: (context, index) => DrugDetailsCardWidget(
              drug: {
                "trade_name": "PANADREX 500 MG TAB",
                "scientific_name": "PARACETAMOL",
                "public_price": "5.05",
                "strength": "500",
                "strength_unit": "",
                "pharmaceutical_form": "Tablet",
                "administration_route": "Oral use",
                "shelf_life": "48",
                "storage_condition_arabic": "Store below 30\u00b0C ,  protect from Light",
                "package_details": {
                  "size": null,
                  "size_unit": null,
                  "package_types": "Blister",
                  "package_size": "24"
                },
                "technical_details": {
                  "product_type": "Human",
                  "drug_type": "Generic",
                  "atc_code1": "N02BE01",
                  "atc_code2": null,
                  "legal_status": "OTC",
                  "product_control": "Uncontrolled",
                  "authorization_status": "Valid"
                },
                "logistics": {
                  "marketing_company": "KUWAIT SAUDI PHARMACEUTICAL INDUSTRIES",
                  "marketing_country": "Kuwait",
                  "manufacturer_name": "KUWAIT SAUDI PHARMACEUTICAL INDUSTRIES",
                  "manufacturer_country": "Kuwait",
                  "secondary_package_manufacturer": null,
                  "main_agent": "ZIMMO TRADING ESTABLISHMENT",
                  "second_agent": "Cigalah Group",
                  "third_agent": null,
                  "distribute_area": "Pharmacy"
                },
                "ids": {
                  "register_number": "2511246335",
                  "reference_number": "HG00354-00-00-00-381",
                  "old_register_number": "1-352-00",
                  "description_code": "7000000961-500-100000073664",
                  "last_update": "45673.58647"
                }
              },
            ),
          )
          //TODO : Empty And Profile Not Complete
          // SliverFillRemaining(
          //   hasScrollBody: false,
          //   child: EmptyDrugsWidget(),
          // ),
          // SliverFillRemaining(
          //   hasScrollBody: false,
          //   child: IncompleteProfileWidget(),
          // ),
        ],
      ),
    );
  }
}
