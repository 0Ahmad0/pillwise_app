import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../core/widgets/app_image_picker_bottom_sheet.dart';
import '../services/image_picker_service.dart';

class ImagePickerController extends GetxController {
  final ImagePickerService _imagePickerService = ImagePickerService();

  final Rx<File?> selectedImage = Rx<File?>(null);
  final RxBool isLoading = false.obs;

  // دالة لفتح BottomSheet
  void showImagePickerBottomSheet() {
    Get.bottomSheet(

      backgroundColor: Get.theme.colorScheme.surface,
      ImagePickerBottomSheet(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.r),
        ),
      ),
      isDismissible: true,
    );
  }

  // اختيار صورة من المعرض
  Future<void> pickFromGallery() async {
    try {
      isLoading.value = true;
      Get.back(); // إغلاق الـ BottomSheet

      final File? image = await _imagePickerService.pickImageFromGallery();
      if (image != null) {
        selectedImage.value = image;
        Get.snackbar('نجاح', 'تم اختيار الصورة بنجاح');
      }
    } catch (e) {
      Get.snackbar('خطأ', 'فشل في اختيار الصورة');
    } finally {
      isLoading.value = false;
    }
  }

  // اختيار صورة من الكاميرا
  Future<void> pickFromCamera() async {
    try {
      isLoading.value = true;
      Get.back(); // إغلاق الـ BottomSheet

      final File? image = await _imagePickerService.pickImageFromCamera();
      if (image != null) {
        selectedImage.value = image;
        Get.snackbar('نجاح', 'تم التقاط الصورة بنجاح');
      }
    } catch (e) {
      Get.snackbar('خطأ', 'فشل في التقاط الصورة');
    } finally {
      isLoading.value = false;
    }
  }

  // حذف الصورة المختارة
  void deleteImage() {
    selectedImage.value = null;
    Get.back(); // إغلاق الـ BottomSheet
    Get.snackbar('نجاح', 'تم حذف الصورة بنجاح');
  }
}
