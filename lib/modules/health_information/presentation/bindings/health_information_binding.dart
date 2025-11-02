import 'package:get/get.dart';
import '../controllers/health_information_controller.dart';

class HealthInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthInformationController>(
      () => HealthInformationController(),
    );
  }
}
