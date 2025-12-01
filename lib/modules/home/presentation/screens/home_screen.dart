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
import 'package:pillwise_app/modules/home/presentation/widgets/medication_card_widget.dart';
import 'package:pillwise_app/modules/home/presentation/widgets/welcome_section_widget.dart';
import 'package:pillwise_app/modules/medication_details/presentation/screens/medication_details_screen.dart';
import '../../data/models/medication_model.dart';
import '../controllers/home_controller.dart';
import '../widgets/incomplete_profile_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarWidget(
        title: controller.currentTime.value,
        showBackButton: false,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: WelcomeSectionWidget(),
          ),
          SliverList.builder(
            itemCount: 3,
            itemBuilder: (context, index) => MedicationCardWidget(
              drug: Drug(
                id: 'DRG_002',
                tradeName: 'tradeName',
                scientificName: 'scientificName',
                price: 30.0,
                form: 'form',
                route: 'route',
                storage: 'storage',
                shelfLife: 'shelfLife',
                legalStatus: 'legalStatus',
                manufacturer: 'manufacturer',
                country: 'country',
                packageSize: 30,
              ),
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
