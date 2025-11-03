import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// نستخدم GetxService لتبقى في الذاكرة كـ Singleton
class ImagePickerService extends GetxService {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    return File(image.path);
  }

  Future<File?> pickFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;
    return File(image.path);
  }
}