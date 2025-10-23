import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/core/constants/app_assets.dart';
import 'package:pillwise_app/app/core/theme/typography.dart';
import 'package:pillwise_app/app/core/widgets/app_scaffold_widget.dart';
import 'package:pillwise_app/modules/auth/presentation/controllers/auth_controller.dart';
import 'package:pillwise_app/modules/onboarding/presentation/widgets/onboarding_page_widget.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                AppAssets.loginLogo,
                width: 160.w,
                height: 160.w,
              ).zoomIn(),
              10.verticalSpace,
              TextFormField(),
              10.verticalSpace,
              TextFormField(),
            ],
          ),
        ),
      ),
    );
  }
}
