import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:pillwise_app/app/core/constants/app_constants.dart';
import 'package:pillwise_app/modules/auth/presentation/controllers/login_controller.dart';

import '../../../../app/controllers/firebase/firebase_constants.dart';
import '../../../../app/controllers/firebase/firebase_fun.dart';
import '../../../../app/core/local/storage.dart';
import '../../../../app/core/models/user_model.dart';
import '../../../../app/core/widgets/constants_widgets.dart';
import '../../../../app/routes/app_routes.dart';
import '../../../../generated/locale_keys.g.dart';

class SignupController extends GetxController {
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Future<void> processSignup({UserModel? userSign}) async {
    final isValid = userSign!=null||formKey.currentState!.validate();

    if (!isValid) {
      Get.snackbar(tr(LocaleKeys.error)??"خطأ", tr(LocaleKeys.please_check_all_fields)??"الرجاء التأكد من جميع الحقول المدخلة");
      return;
    }
    String name =userSign?.name??nameController.value.text.trim();
    String userName = userSign?.userName??userNameController.value.text.trim().toLowerCase();
    String email =userSign?.email??emailController.value.text.trim().toLowerCase();
    String phoneNumber =userSign?.phoneNumber?? phoneController.value.text.trim();
    String password = userSign?.password??confirmPasswordController.value.text.trim();

    try {
      ConstantsWidgets.showLoading();
      var result = await FirebaseFun.fetchUserByUserNameAndEmail(userName: userName,email: email);
      if (result['status'] && result['body'] != null) {
        UserModel? userModel = UserModel.fromJson(result['body']);
        if(userModel!=null)
          throw (tr(LocaleKeys.user_name_or_email_already_found)??"user_name_or_email_already_found");
      }

      UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .timeout(FirebaseFun.timeOut);




      final user = UserModel(
        id: userName+DateTime.now().toIso8601String(),
        uid: userCredential.user!.uid,
        email: email,
        name: name,
        phoneNumber: phoneNumber,
        userName: userName,
        password: password,

        typeUser: AppConstants.collectionUser,
        googleId: userSign?.googleId,
        photoUrl: userSign?.photoUrl??'',
      );
     await FirebaseFirestore.instance
          .collection(FirebaseConstants.collectionUser)
          .doc(user.uid)
          .set(user.toJson());
      // await AppStorage.storageWrite(key: AppConstants.rememberMe, value: true);
      // await AppStorage.storageWrite(key: AppConstants.uidKEY, value: user.uid);

      ConstantsWidgets.closeDialog();
      ConstantsWidgets.TOAST(null, textToast:tr(LocaleKeys.account_created_successfully)?? "Account created successfull", state: true);
      if(userSign==null)
      Get.offAllNamed(AppRoutes.login);
      else
        Get.put(LoginController()).processLogin(userSign: userSign,);
    }
    on FirebaseAuthException catch (e) {
      String errorMessage = FirebaseFun.findTextToast(e.code);
      ConstantsWidgets.closeDialog();
      ConstantsWidgets.TOAST(null, textToast: errorMessage, state: false);
    }
    catch (e) {
      String errorMessage = FirebaseFun.findTextToast(e.toString());
      ConstantsWidgets.closeDialog();
      ConstantsWidgets.TOAST(null, textToast: errorMessage, state: false);
    }
  }




  @override
  void onClose() {
    nameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    super.onClose();
  }
}
