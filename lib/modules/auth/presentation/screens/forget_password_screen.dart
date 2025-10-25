import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/core/constants/app_assets.dart';
import 'package:pillwise_app/app/core/theme/typography.dart';
import 'package:pillwise_app/app/core/widgets/app_scaffold_widget.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';
import 'package:pillwise_app/modules/auth/presentation/controllers/auth_controller.dart';
import 'package:pillwise_app/modules/auth/presentation/controllers/forget_password_controller.dart';
import 'package:pillwise_app/modules/auth/presentation/controllers/login_controller.dart';
import 'package:pillwise_app/modules/onboarding/presentation/widgets/onboarding_page_widget.dart';

import '../../../../app/core/widgets/app_button_widget.dart';
import '../../../../app/core/widgets/app_text_button_widget.dart';
import '../../../../app/core/widgets/app_text_filed_widget.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordController> {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
    );
  }
}
