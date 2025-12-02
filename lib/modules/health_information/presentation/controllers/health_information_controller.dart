// controllers/health_info_controller.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';
import 'package:pillwise_app/modules/profile/presentation/controllers/profile_controller.dart';

import '../../../../app/core/constants/app_constants.dart';
import '../../../../app/core/constants/strings.dart';
import '../../../../app/core/local/storage.dart';
import '../../../../app/core/models/user_model.dart';
import '../../../../app/core/widgets/constants_widgets.dart';
import '../../data/models/health_info_model.dart';

class HealthInformationController extends GetxController {
  var healthInfo = HealthInfo().obs;
  var isEditMode = false.obs;
  var showFemaleOptions = false.obs;
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final timeLimit = Duration(seconds: 60);
  @override
  void onInit() {
    super.onInit();
    // تحميل البيانات من التخزين المحلي إذا كانت موجودة
    loadHealthInfo();
  }

  void loadHealthInfo() {


    // هنا يمكنك تحميل البيانات من SharedPreferences أو أي تخزين محلي
    // مثال:
    healthInfo.value = HealthInfo(
      gender: 'Female',
      dateOfBirth: DateTime(2000, 2, 14),
      height: 170,
      weight: 60,
      currentMedications: '',
    );

    UserModel? currentUser= AppStorage.getUserStorage();
    healthInfo.value=currentUser?.healthInfo??HealthInfo();
    // healthInfo.value=Get.find<ProfileController>().currentUser?.value?.healthInfo??HealthInfo();
    weightController.text=  healthInfo.value?.weight?.toString()??'';
    heightController.text=  healthInfo.value?.height?.toString()??'';
    if(healthInfo.value.dateOfBirth!=null)
    updateDateOfBirth(healthInfo.value.dateOfBirth!);
    weightController.addListener((){
      updateWeight(weightController.value.text);
    });
    heightController.addListener((){

      updateHeight(heightController.value.text);
    });
    updateFemaleOptionsVisibility();
  }

  void updateGender(String? newGender) {
    healthInfo.update((val) {
      val?.gender = newGender;
    });
    updateFemaleOptionsVisibility();
  }

  void updateFemaleOptionsVisibility() {
    showFemaleOptions.value =
        healthInfo.value.gender == tr(LocaleKeys.health_info_female_g);
  }

  void updateDateOfBirth(DateTime newDate) {
    healthInfo.update((val) {
      val?.dateOfBirth = newDate;
    });

    dateOfBirthController.text = DateFormat.yMd().format(newDate);
    update();
  }


  void updateHeight(String value) {
    if (true||value.isNotEmpty) {
      healthInfo.update((val) {
        val?.height = num.tryParse(value);
      });
    }
  }

  void updateWeight(String value) {
    if (true||value.isNotEmpty) {
      healthInfo.update((val) {
        val?.weight = num.tryParse(value);
      });
    }
  }

  void updatePregnant(bool value) {
    healthInfo.update((val) {
      val?.isPregnant = value;
    });
  }

  void updateBreastfeeding(bool value) {
    healthInfo.update((val) {
      val?.isBreastfeeding = value;
    });
  }

  void updateMedications(String value) {
    healthInfo.update((val) {
      val?.currentMedications = value;
    });
  }

  void toggleEditMode() {
    isEditMode.value = !isEditMode.value;
  }

  Future<void> saveChanges() async {
    // حفظ البيانات في التخزين المحلي
    // مثال: await SharedPreferences.getInstance().then((prefs) { ... });


    try {
      ConstantsWidgets.showLoading();


      UserModel? currentUser= AppStorage.getUserStorage();

      UserModel? userModel=currentUser?.copyWith(healthInfo: healthInfo.value);
      // UserModel? userModel=Get.find<ProfileController>().currentUser?.value?.copyWith(healthInfo: healthInfo.value);
      var data=userModel?.toJson()??{};
      data.remove("password");

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentUser?.uid ?? '')
          // .doc(Get.find<ProfileController>().currentUser?.value?.uid ?? '')
          .update(data).timeout(timeLimit)
          .then((value) async {

        await AppStorage.storageDelete(key: AppConstants.User);
        await AppStorage.storageWrite(
            key: AppConstants.User, value: userModel);
        // Get.find<ProfileController>().currentUser?.value=userModel;
        update();

        ConstantsWidgets.closeDialog();

        Get.snackbar(
          'تم الحفظ',
          'تم حفظ المعلومات الصحية بنجاح',
          snackPosition: SnackPosition.BOTTOM,
        );
        isEditMode.value = false;

      });

    } catch (e) {
      String errorMessage;
      errorMessage = "An unexpected error occurred. Please try again later.";
      ConstantsWidgets.closeDialog();
      // Get.back();
      Get.snackbar(
          Strings.message_failure,
          errorMessage,
          backgroundColor:Colors.redAccent
      );
    }



  }


  bool get hasAllRequiredInfo {
    return healthInfo.value.gender != null &&
        healthInfo.value.dateOfBirth != null &&
        healthInfo.value.height != null &&
        healthInfo.value.height! > 0 &&
        healthInfo.value.weight != null &&
        healthInfo.value.weight! > 0;
  }
}
