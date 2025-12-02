// controllers/home_controller.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../app/controllers/firebase/firebase_constants.dart';
import '../../../../app/core/local/storage.dart';
import '../../../../app/core/models/medicine_model.dart';
import '../../../../app/core/models/user_model.dart';
import '../../data/models/medication_model.dart';

class HomeController extends GetxController {
  var medications = <Medication>[].obs;
  var isProfileComplete = false.obs;
  var currentTime = ''.obs;
  Medicines medicines=Medicines(items: []);
  Medicines medicinesWithFilter=Medicines(items: []);
  String? uid;
  var getMedicines;

  @override
  void onInit() {
    super.onInit();
    loadMedications();
    updateCurrentTime();
    // تحديث الوقت كل دقيقة
    UserModel? currentUser= AppStorage.getUserStorage();
    uid= currentUser?.uid;
    getMedicinesFun();
    ever(medications, (_) => updateCurrentTime());
  }



  getMedicinesFun() async {
    getMedicines =_fetchMedicinesStream();
    return getMedicines;
  }
  _fetchMedicinesStream() {

    final result = FirebaseFirestore.instance.collection(FirebaseConstants.collectionDrug)
        .snapshots()
    ;
    return result;
  }
  filterMedicines() async {

    medicinesWithFilter.items=[];

    medicines.items.forEach((element) {

      if(element.userIsAdd(uid??''))
        medicinesWithFilter.items.add(element);
    });
    // update();
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