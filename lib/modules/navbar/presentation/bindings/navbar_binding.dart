import 'package:get/get.dart';
import 'package:pillwise_app/modules/add_medication/presentation/bindings/add_medication_binding.dart';
import '../../../home/presentation/bindings/home_binding.dart';
import '../../../profile/presentation/bindings/profile_binding.dart';
import '../controllers/navbar_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarController>(
      () => NavbarController(),
    );
    HomeBinding().dependencies();
    AddMedicationBinding().dependencies();
    ProfileBinding().dependencies();
  }
}
