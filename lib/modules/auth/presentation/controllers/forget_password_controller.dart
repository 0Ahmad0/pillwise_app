import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/controllers/firebase/firebase_fun.dart';
import '../../../../app/core/models/user_model.dart';
import '../../../../app/core/widgets/constants_widgets.dart';
import '../../../../generated/locale_keys.g.dart';

class ForgetPasswordController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  Future<void> processForgetPassword() async {
    final isValid = formKey.currentState!.validate();

    if (!isValid) {

    Get.snackbar(tr(LocaleKeys.error)??"خطأ",tr(LocaleKeys.please_check_all_fields)?? "الرجاء التأكد من جميع الحقول المدخلة");
      return;
    }
    ConstantsWidgets.showLoading();
    var result = await FirebaseFun.sendPasswordResetEmail(email: emailController.value.text.trim().toLowerCase());
    ConstantsWidgets.closeDialog();

    if (result['status']) {
      Get.back();
      ConstantsWidgets.TOAST(null,
          textToast: FirebaseFun.findTextToast(result['message'].toString()),
          state: result['status']);
    } else {
      ConstantsWidgets.TOAST(null,
          textToast: FirebaseFun.findTextToast(result['message'].toString()),
          state: result['status']);
    }
  }




  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

}
