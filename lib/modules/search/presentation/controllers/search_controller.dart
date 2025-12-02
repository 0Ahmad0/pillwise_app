import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/core/models/medicine_model.dart';

import '../../../../app/controllers/firebase/firebase_constants.dart';
import '../../../../app/core/local/storage.dart';
import '../../../../app/core/models/user_model.dart';
import '../../../profile/presentation/controllers/profile_controller.dart';

class SearchAppController extends GetxController {
  //TODO: Implement SearchController

  final count = 0.obs;
  final searchController = TextEditingController();
  Medicines medicines=Medicines(items: []);
  Medicines medicinesWithFilter=Medicines(items: []);
  String? uid;
  var getMedicines;

  @override
  void onInit() {
    searchController.clear();
    UserModel? currentUser= AppStorage.getUserStorage();
    uid= currentUser?.uid;
    getMedicinesFun();
    super.onInit();
  }

  getMedicinesFun() async {
    getMedicines =_fetchMedicinesStream();
    return getMedicines;
  }
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }


  _fetchMedicinesStream() {

    final result = FirebaseFirestore.instance.collection(FirebaseConstants.collectionDrug)
        .snapshots()
    ;
    return result;
  }
  filterMedicines({required String term}) async {

    medicinesWithFilter.items=[];

    medicines.items.forEach((element) {

        if(
        (element.id?.toLowerCase().contains(term.toLowerCase())??false)||
            (element.tradeName?.toLowerCase().contains(term.toLowerCase())??false)
        )
          medicinesWithFilter.items.add(element);
    });
    update();
  }




  @override
  void onReady() {
    searchController.clear();
    UserModel? currentUser= AppStorage.getUserStorage();
    uid= currentUser?.uid;
    getMedicinesFun();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
