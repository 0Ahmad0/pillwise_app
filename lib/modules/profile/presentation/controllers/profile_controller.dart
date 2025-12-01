import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pillwise_app/app/core/theme/app_colors.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';

import '../../../../app/controllers/firebase/firebase_constants.dart';
import '../../../../app/controllers/firebase/firebase_fun.dart';
import '../../../../app/controllers/image_picker_controller.dart';
import '../../../../app/core/constants/app_constants.dart';
import '../../../../app/core/constants/strings.dart';
import '../../../../app/core/local/storage.dart';
import '../../../../app/core/models/user_model.dart';
import '../../../../app/core/widgets/constants_widgets.dart';
import '../../../auth/presentation/screens/login_screen.dart';
import '../../../settings/presentation/controllers/settings_controller.dart';
import '../widgets/dialog_with_shaddow_widget.dart';

class ProfileController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final profileFormKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final timeLimit = Duration(seconds: 60);
  final Rx<File?> selectedImage = Rx<File?>(null);
  final Rx<String?> country = Rx<String?>(null);

  final ImagePicker _picker = ImagePicker();

  final List<String> countries = [
    tr(LocaleKeys.countries_EG) + ' 🇪🇬',
    tr(LocaleKeys.countries_SA) + ' 🇸🇦',
    tr(LocaleKeys.countries_AE) + ' 🇦🇪',
    tr(LocaleKeys.countries_QA) + ' 🇶🇦',
    tr(LocaleKeys.countries_KW) + ' 🇰🇼',
    tr(LocaleKeys.countries_BH) + ' 🇧🇭',
    tr(LocaleKeys.countries_OM) + ' 🇴🇲',
    tr(LocaleKeys.countries_JO) + ' 🇯🇴',
    tr(LocaleKeys.countries_LB) + ' 🇱🇧',
    tr(LocaleKeys.countries_SY) + ' 🇸🇾',
    tr(LocaleKeys.countries_IQ) + ' 🇮🇶',
    tr(LocaleKeys.countries_PS) + ' 🇵🇸',
    tr(LocaleKeys.countries_YE) + ' 🇾🇪',
    tr(LocaleKeys.countries_LY) + ' 🇱🇾',
    tr(LocaleKeys.countries_TN) + ' 🇹🇳',
    tr(LocaleKeys.countries_DZ) + ' 🇩🇿',
    tr(LocaleKeys.countries_MA) + ' 🇲🇦',
    tr(LocaleKeys.countries_MR) + ' 🇲🇷',
    tr(LocaleKeys.countries_SD) + ' 🇸🇩',
    tr(LocaleKeys.countries_SO) + ' 🇸🇴',
    tr(LocaleKeys.countries_DJ) + ' 🇩🇯',
    tr(LocaleKeys.countries_KM) + ' 🇰🇲',
  ];

  // final Rx<UserModel?> currentUser = Rx(null);

  @override
  void onInit() {
    super.onInit();
    loadProfileInfo();
  }

  void loadProfileInfo() {
    UserModel? currentUser= AppStorage.getUserStorage();
    usernameController.text=  currentUser?.userName??'';
    fullNameController.text=  currentUser?.name??'';
    emailController.text=  currentUser?.email??'';
    phoneController.text=  currentUser?.phoneNumber??'';
    country.value=  currentUser?.country;

  }

  Future<void> updateUser(
      ) async {
    UserModel? currentUser= AppStorage.getUserStorage();
    String userName=usernameController.value.text.trim();
    String name=fullNameController.value.text.trim();
    String email=emailController.value.text.trim();
    String phoneNumber=phoneController.value.text.trim();



    try {
      ConstantsWidgets.showLoading();
      String? imagePath;
      // if( Get.find<ImagePickerController>()
      //     .selectedImage
      //     .value!=null){
      //   imagePath=await FirebaseFun.uploadImage(image: XFile( Get.find<ImagePickerController>()
      //       .selectedImage
      //       .value!.path));
      //   if(imagePath==null)
      //     return;
      //
      // }

      if(email!=currentUser?.email)
        auth.currentUser?.verifyBeforeUpdateEmail(email);

      // auth.currentUser?.updateEmail();
      // if(password!=''&&password!=null)
      //   auth.currentUser?.updatePassword(password!);

      UserModel? userModel=currentUser?.copyWith(
        name: name,
        userName: userName,
        email: email,
        phoneNumber: phoneNumber,
        photoUrl: imagePath,
          country:country.value


      );
      var data=userModel?.toJson()??{};
      data?.remove("password");

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid ??currentUser?.uid?? '')
          .update(data).timeout(timeLimit)
          .then((value) async {

        currentUser=userModel;
        await AppStorage.storageDelete(key: AppConstants.User);
        await AppStorage.storageWrite(
            key: AppConstants.User, value: userModel);
        update();

        ConstantsWidgets.closeDialog();
        // Get.back();
        Get.dialog(
            DialogWithShadowWidget(
              text: Strings
                  .saveInformationSuccessfulText,
            ));
        Timer(Duration(seconds: 2), (){
          Get.back();

        });
        // Get.snackbar(
        //     Strings.message_success,
        //     Strings.profileUpdateSuccessFullText,
        //     // Strings.message_successfully_update,
        //     backgroundColor: ColorsManager.successColor
        // );
        // if(email!=currentUser.value?.email||(password!=''&&password!=null))
        //    Get.offAll(SplashScreen());

      });

    } catch (e) {
      String errorMessage;
      // errorMessage = "An unexpected error occurred. Please try again later.";
      errorMessage = "An unexpected error occurred. Please try again later.";
      ConstantsWidgets.closeDialog();
      // Get.back();
      Get.snackbar(
          Strings.message_failure,
          errorMessage,
          backgroundColor: AppColors.error
      );
    }
  }

  Future<void> processDeleteAccount() async {
    Get.defaultDialog(
      title: "Confirm Delete",
      middleText: "Are you sure you want to delete account?",
      textConfirm: "Delete",
      textCancel: "Cancel",
      onConfirm: () async {
        Get.back();
        deleteAccount();

      },
    );
  }
  Future<void> deleteAccount() async {
    try {
      ConstantsWidgets.showLoading();
      await Future.delayed(Duration(seconds: 5));
      await auth.currentUser?.delete().timeout(FirebaseFun.timeOut);
      await FirebaseFirestore.instance
          .collection(FirebaseConstants.collectionUser)
          .doc(await AppStorage.storageRead(key: AppConstants.uidKEY))
          .delete();
      ConstantsWidgets.closeDialog();
      Get.dialog(
        DialogWithShadowWidget(text: Strings.successfulDeleteAccountText),
      );
      Timer(Duration(seconds: 3), () {
        Get.back();
        Get.put(SettingsController()).processLogout();
      });
    } on FirebaseAuthException catch (e) {
      String errorMessage = FirebaseFun.findTextToast(e.code);
      ConstantsWidgets.closeDialog();
      ConstantsWidgets.TOAST(null, textToast: errorMessage, state: false);
    }
  }


  Future<void> pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) selectedImage.value = File(image.path);
  }

  Future<void> pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) selectedImage.value = File(image.path);
  }

  void removeImage() {
    selectedImage.value = null;
  }

  Future<void> getUser() async {
    try {
      print(FirebaseAuth.instance.currentUser?.uid ??
          '${await AppStorage.storageRead(key: AppConstants.uidKEY)}'??'');
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid ??
          '${await AppStorage.storageRead(key: AppConstants.uidKEY)}'??'')
          .get()
          .then((value) async {

        await AppStorage.storageDelete(key: AppConstants.User);
        await AppStorage.storageWrite(
            key: AppConstants.User, value: UserModel.fromJson(value));


        // currentUser.value=UserModel.fromJson(value);
        update();
        // Get.snackbar(
        //     AppString.message_success,
        //     AppString.message_successful_get_user,
        //     backgroundColor: ColorsManager.successColor
        // );
      });
      // if(currentUser.value?.isAdmin??false)
      //   Get.offAll(NavBarAdminScreen());
      // else
      //   Get.offAll(NavbarUserScreen());



    } catch (e) {
      await AppStorage.storageWrite(
          key: AppConstants.User, value: null);
      // currentUser.value= null;
      String errorMessage;
      // errorMessage = "An unexpected error occurred. Please try again later.";
      errorMessage = "An unexpected error occurred. Please try again later.";
      Get.snackbar(
          Strings.message_failure,
          errorMessage,
          backgroundColor: Colors.redAccent
      );
      // context.pushAndRemoveUntil(Routes.loginRoute, predicate: (Route<dynamic> route) =>false);

      Get.offAll(()=>LoginScreen());
    }
  }


  // Validation Methods
  // String? validateUsername(String? value) {
  //   return FieldValidator([
  //     RequiredValidator(),
  //     UsernameValidator(),
  //   ]).validate(value ?? '');
  // }
  // String? validateFullName(String? value) {
  //   return FieldValidator([
  //     RequiredValidator(),
  //   ]).validate(value ?? '');
  // }
  //
  // String? validateEmail(String? value) {
  //   return FieldValidator([
  //     RequiredValidator(),
  //     EmailValidator(),
  //   ]).validate(value ?? '');
  // }
  //
  // String? validatePhone(String? value) {
  //   return FieldValidator([
  //     RequiredValidator(),
  //     PhoneNumberValidator(),
  //   ]).validate(value ?? '');
  // }

  void editProfile() {
    if (profileFormKey.currentState?.validate() ?? false) {
      print('تسجيل المستخدم: ${usernameController.text}');
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }

}
