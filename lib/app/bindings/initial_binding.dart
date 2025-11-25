import 'package:get/get.dart';

import '../controllers/image_picker_controller.dart';
import '../services/image_picker_service.dart';


class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ImagePickerController(), permanent: true);
  }
}
