// controllers/health_info_controller.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';

import '../../data/models/health_info_model.dart';

class HealthInformationController extends GetxController {
  var healthInfo = HealthInfo().obs;
  var isEditMode = false.obs;
  var showFemaleOptions = false.obs;
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

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
    // healthInfo.update((val) {
    //   val?.dateOfBirth = newDate;
    // });

    dateOfBirthController.text = DateFormat.yMd().format(newDate);
    update();
  }

  void updateHeight(String value) {
    if (value.isNotEmpty) {
      healthInfo.update((val) {
        val?.height = double.tryParse(value);
      });
    }
  }

  void updateWeight(String value) {
    if (value.isNotEmpty) {
      healthInfo.update((val) {
        val?.weight = double.tryParse(value);
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

  void saveChanges() {
    // حفظ البيانات في التخزين المحلي
    // مثال: await SharedPreferences.getInstance().then((prefs) { ... });

    Get.snackbar(
      'تم الحفظ',
      'تم حفظ المعلومات الصحية بنجاح',
      snackPosition: SnackPosition.BOTTOM,
    );
    isEditMode.value = false;
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
