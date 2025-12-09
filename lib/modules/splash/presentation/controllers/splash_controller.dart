import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/routes/app_routes.dart';
import 'package:pillwise_app/modules/auth/presentation/controllers/login_controller.dart';

import '../../../../app/core/constants/app_constants.dart';
import '../../../../app/core/local/storage.dart';
import '../../../../app/core/models/user_model.dart';
import '../../../auth/presentation/screens/login_screen.dart';
import '../../../profile/presentation/controllers/profile_controller.dart';

class SplashController extends GetxController {
  int delaySplash=1;
  @override
  void onReady() {
    print("READY");
    // Future.delayed(const Duration(seconds: AppConstants.splashDuration), () {
    //   Get.offAllNamed(AppRoutes.welcome);
    // });
    initSplash();

    super.onReady();
  }

  Future<void> _loadSplash()  async {
    await Future.delayed( Duration(seconds: delaySplash), () {
      // Get.offAll(page);
    });


    if((await AppStorage.storageRead(key: AppConstants.rememberMe) as bool?) ??false){
      // ConstantsWidgets.showLoading(context);

      ProfileController profileController=Get.put(ProfileController());

      await profileController.getUser();

      UserModel? currentUser= AppStorage.getUserStorage();
      if(currentUser!=null)
      // if(profileController.currentUser.value!=null)
       Get.offAllNamed(AppRoutes.navbar);
      else
        Get.offAllNamed(AppRoutes.welcome);
    }else
      Get.offAllNamed(AppRoutes.onboarding);
  }
  Future<void> _initSplash() async {
    await AppStorage.init();
    // Get.put(ProfileController());
    // Get.lazyPut(() => ProfileController());
    // Get.lazyPut(() => LoginController());
  }
  Future<void> initSplash() async {
    await _initSplash();
    await _loadSplash();
  }

}
