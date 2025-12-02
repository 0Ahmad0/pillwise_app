
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:pillwise_app/app/routes/app_routes.dart';
import 'package:pillwise_app/modules/auth/presentation/controllers/signup_controller.dart';
import 'package:pillwise_app/modules/profile/presentation/controllers/profile_controller.dart';

import '../../../../app/controllers/firebase/firebase_fun.dart';
import '../../../../app/core/constants/app_constants.dart';
import '../../../../app/core/local/storage.dart';
import '../../../../app/core/models/user_model.dart';
import '../../../../app/core/widgets/constants_widgets.dart';

class LoginController extends GetxController{
  final TextEditingController userNameOrEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();

  final RxBool rememberMe = false.obs;

  void toggleRememberMe(bool? newValue) {
    rememberMe.value = newValue ?? false;
  }

  Future<void> processLogin({UserModel? userSign}) async {
    final isValid =userSign!=null|| formKey.currentState!.validate();

    if (!isValid) {
      Get.snackbar("خطأ", "الرجاء التأكد من جميع الحقول المدخلة");
      return;
    }else{

      String userNameOrEmail =userSign?.email??userNameOrEmailController.value.text.trim().toLowerCase();
      String password = userSign?.password??passwordController.value.text.trim();
      ConstantsWidgets.showLoading();
      try{
        var result = await FirebaseFun.fetchUserByUserNameOrEmail(userNameOrEmail: userNameOrEmail);
        UserModel? userModel;
        if (result['status'] && result['body'] != null) {
           userModel = UserModel.fromJson(result['body']);
          if(userModel==null)
          throw ("user_name_or_email_invalid");

          // if(userModel?.password!=password)
          //   throw ("password_and_email_has_not_match");
        }else{
          throw ("user_name_or_email_invalid");
        }
        await auth
            .signInWithEmailAndPassword(email: userModel.email??userNameOrEmail, password: password)
            .timeout(FirebaseFun.timeOut)
            .then((value) async {
          await AppStorage.storageWrite(
              key: AppConstants.rememberMe, value: rememberMe.value);
          await AppStorage.storageWrite(
              key: AppConstants.uidKEY, value: userModel?.uid);
          await AppStorage.storageWrite(
              key: AppConstants.EMAIL_KEY, value: userNameOrEmail);
          await AppStorage.storageWrite(
              key: AppConstants.PASSWORD_KEY, value: password);


          await AppStorage.storageDelete(key: AppConstants.User);
          await AppStorage.storageWrite(
              key: AppConstants.User, value: userModel);
          // Get.find<ProfileController>().currentUser.value=userModel;
          ConstantsWidgets.closeDialog();
          Get.offAllNamed(AppRoutes.navbar);
        });



      } on FirebaseAuthException catch (e) {
        String errorMessage = FirebaseFun.findTextToast(e.code);
        ConstantsWidgets.closeDialog();
        ConstantsWidgets.TOAST(null, textToast: errorMessage, state: false);

      }
      catch (e){
        String errorMessage = FirebaseFun.findTextToast(e.toString());
        ConstantsWidgets.closeDialog();
        ConstantsWidgets.TOAST(null, textToast: errorMessage, state: false);
      }

      // Get.offAllNamed(AppRoutes.navbar);
    }
  }

  Future<void> signWithGoogle() async {}

  _getUserNameByName(String name) async {
    String genUserName = _generateUserNameByName(name);
    String userName = genUserName;
    var result = await FirebaseFun.fetchUsers();
    if (!result['status']) return null;
    Users users = Users.fromJson(result['body']);
    for (int i = 0; i < 10000; i++) {
      bool exists = users.items.any((user) => user.userName == userName);
      if (exists)
        userName = genUserName + '$i';
      else
        break;
    }
    return userName;
  }


  _generateUserNameByName(String name) {
    name = name.toLowerCase();
    List<String> names = name.trim().split(' ');
    String firstName = names.isNotEmpty ? names.first : '';
    String? lastName = names.length > 1 ? names.sublist(1, 2).join(' ') : null;
    String userName = '${firstName}';
    if (lastName != null) userName += '_${lastName}';
    return userName;
  }

  @override
  void onClose() {
    userNameOrEmailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}