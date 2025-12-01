import 'package:get/get.dart';
import '../controllers/medication_details_controller.dart';

class MedicationDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MedicationDetailsController>(
      () => MedicationDetailsController(),
    );
  }
}
