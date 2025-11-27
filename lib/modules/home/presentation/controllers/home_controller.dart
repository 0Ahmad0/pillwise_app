// controllers/home_controller.dart
import 'package:get/get.dart';

import '../../data/models/medication_model.dart';

class HomeController extends GetxController {
  var medications = <Medication>[].obs;
  var isProfileComplete = false.obs;
  var currentTime = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadMedications();
    updateCurrentTime();
    // تحديث الوقت كل دقيقة
    ever(medications, (_) => updateCurrentTime());
  }

  void updateCurrentTime() {
    final now = DateTime.now();
    currentTime.value = '${now.hour}:${now.minute.toString().padLeft(2, '0')}';
  }

  void loadMedications() {
    // بيانات تجريبية
    medications.value = [
      Medication(
        id: '1',
        name: 'Vitamin D',
        dosage: '100 PM',
        time: '1:00 PM',
        intakeDays: 1,
        pauseDays: 30,
        nextIntake: '11:11',
        isCyclic: true,
      ),
      Medication(
        id: '2',
        name: 'Panadol',
        dosage: '500 mg',
        time: '8:00 AM',
        intakeDays: 2,
        pauseDays: 0,
        nextIntake: '10:10',
        isCyclic: true,
      ),
    ];
  }

  void addMedication(Medication medication) {
    medications.add(medication);
  }

  void updateProfileCompletion(bool complete) {
    isProfileComplete.value = complete;
  }
}