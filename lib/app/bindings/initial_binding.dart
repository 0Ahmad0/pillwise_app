import 'package:get/get.dart';

import '../services/image_picker_service.dart';


class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ImagePickerService(), permanent: true);
  }
}
