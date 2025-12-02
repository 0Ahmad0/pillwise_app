import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/controllers/firebase/firebase_fun.dart';
import 'package:pillwise_app/app/core/models/medicine_model.dart';

import '../../../../app/core/widgets/constants_widgets.dart';
import '../../../../app/routes/app_routes.dart';

class ScanBarcodeController extends GetxController{

  Future<void> searchMedication(String id) async {

    ConstantsWidgets.showLoading();
    final result=  await FirebaseFun.fetchMedication(id: id);
    if(!result['status']){
      ConstantsWidgets.closeDialog();
      ConstantsWidgets.TOAST(null,textToast: FirebaseFun.findTextToast(result['message'].toString()),state:result['status'] );

    }else if(result['body']==null){
      ConstantsWidgets.closeDialog();
      ConstantsWidgets.TOAST(null,textToast:"الدواد المقروء غير موجود",state:false );

    }else
      {
        ConstantsWidgets.closeDialog();
        final MedicineModel medicine=MedicineModel.fromJson(result['body']);
        medicine.id=id;
        Get.toNamed(AppRoutes.medicationDetails,arguments: {"medicine":medicine});

      }





  }


}