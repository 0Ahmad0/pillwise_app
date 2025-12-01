import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pillwise_app/app/core/theme/app_colors.dart';

import '../../core/models/user_model.dart';
import 'firebase_constants.dart';

class FirebaseFun {
  static FirebaseAuth auth = FirebaseAuth.instance;

  // time for waiting request to done or show error message
  static Duration timeOut = Duration(seconds: 50);

  ///--Signup
  static Future<Map<String, dynamic>> signUp(
      {required String email, required String password}) {
    final result = auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(FirebaseHelperFun.onValueSignup)
        .catchError(FirebaseHelperFun.onError)
        .timeout(timeOut, onTimeout: FirebaseHelperFun.onTimeOut);
    return result;
  }



  static fetchUser( {required String uid,required String typeUser})  async {
    final result=await FirebaseFirestore.instance.collection(typeUser)
        .where('uid',isEqualTo: uid)
        .get()
        .then((onValueFetchUser))
        .catchError(onError).timeout(timeOut,onTimeout: onTimeOut);
    return result;
  }
  static fetchUserByEmail( {required String email})  async {
    final result=await FirebaseFirestore.instance.collection(FirebaseConstants.collectionUser)
        .where('email',isEqualTo: email)
        .get()
        .then((onValueFetchUserByUserName))
        .catchError(onError).timeout(timeOut,onTimeout: onTimeOut);
    return result;
  }
  static fetchUserByGoogleId( {required String googleId})  async {
    final result=await FirebaseFirestore.instance.collection(FirebaseConstants.collectionUser)
        .where('googleId',isEqualTo: googleId)
        .get()
        .then((onValueFetchUserByUserName))
        .catchError(onError).timeout(timeOut,onTimeout: onTimeOut);
    return result;
  }
  static fetchUserByUserName( {required String userName})  async {
    final result=await FirebaseFirestore.instance.collection(FirebaseConstants.collectionUser)
        .where('userName',isEqualTo: userName)
        .get()
        .then((onValueFetchUserByUserName))
        .catchError(onError).timeout(timeOut,onTimeout: onTimeOut);
    return result;
  }

  static  fetchUserByUserNameOrEmail({
    required String userNameOrEmail,
  }) async {
    try {
      final usersCollection = FirebaseFirestore.instance
          .collection(FirebaseConstants.collectionUser);

      QuerySnapshot? results;


      final usernameQuery = await usersCollection
          .where('userName', isEqualTo: userNameOrEmail)
          .get();

      if(usernameQuery.docs.isNotEmpty){
        results=(usernameQuery);
      }
      else{
        final emailQuery = await usersCollection
            .where('email', isEqualTo: userNameOrEmail)
            .get();

        if(emailQuery.docs.isNotEmpty)
          results= emailQuery;

      }

      if( results==null)
      {
        throw Exception("Account not found");
      }
      return onValueFetchUserByUserName(results);
    } catch (e) {
      return  onError(e);
      // print('Error fetching user: $e');
      // rethrow;
    }
  }
  static  fetchUserByUserNameAndEmail({
    String? userName,
    String? email,
  }) async {
    try {
      final usersCollection = FirebaseFirestore.instance
          .collection(FirebaseConstants.collectionUser);

      QuerySnapshot? results;

      if (userName == null && email == null) {
        throw Exception("يجب إدخال userName أو email");
      }

      if (userName != null) {
        final usernameQuery = await usersCollection
            .where('userName', isEqualTo: userName)
            .get();

        if(usernameQuery.docs.isNotEmpty)
        results=(usernameQuery);
      }

      if (email != null) {
        final emailQuery = await usersCollection
            .where('email', isEqualTo: email)
            .get();

        if(emailQuery.docs.isNotEmpty||results==null)
          results= emailQuery;

      }

      return onValueFetchUserByUserName(results);
    } catch (e) {
      return  onError(e);
      // print('Error fetching user: $e');
      // rethrow;
    }
  }

  static fetchUserId( {required String id,required String typeUser})  async {
    final result=await FirebaseFirestore.instance.collection(typeUser)
        .where('id',isEqualTo: id)
        .get()
        .then((onValueFetchUserId))
        .catchError(onError).timeout(timeOut,onTimeout: onTimeOut);
    //  print("${id} ${result}");
    return result;
  }
  static fetchUserUid( {required String uid,required String typeUser})  async {
    final result=await FirebaseFirestore.instance.collection(typeUser)
        .where('uid',isEqualTo: uid)
        .get()
        .then((onValueFetchUserId))
        .catchError(onError).timeout(timeOut,onTimeout: onTimeOut);
    return result;
  }

  static fetchUsers()  async {
    final result=await FirebaseFirestore.instance.collection(FirebaseConstants.collectionUser)
        .get()
        .then((onValueFetchUsers))
        .catchError(onError).timeout(timeOut,onTimeout: onTimeOut);
    return result;
  }
  static sendPasswordResetEmail({required String email}) async {
    final result = await FirebaseAuth.instance
        .sendPasswordResetEmail(
      email: email,
      ///"temp@gmail.com",
    )
        .then((onValueSendPasswordResetEmail))
        .catchError(onError);
    return result;
  }
  static checkCodeToResetPassword({required String code}) async {
    final result = await FirebaseAuth.instance
        .checkActionCode(code,
    )
        .then((onValueCheckCodeToResetPassword))
        .catchError(onError);

    return result;
  }

  static Future<Map<String,dynamic>>  onError(error) async {
    return {
      'status':false,
      'message':error,
      // 'body':null
    };
  }
  static Future<Map<String,dynamic>>  onTimeOut() async {
    return {
      'status':false,
      'message':'time out',
      //'body':""
    };
  }
  static Future<Map<String,dynamic>>  errorUser(String messageError) async {
    print(false);
    print(messageError);
    return {
      'status':false,
      'message':messageError,
      //'body':""
    };
  }
  static Future<Map<String,dynamic>> onValueFetchUser(value) async{
    // print(true);
    print('uid ${await (value.docs.length>0)?value.docs[0]['uid']:null}');
    print("user : ${(value.docs.length>0)?UserModel.fromJson(value.docs[0]).toJson():null}");
    return {
      'status':true,
      'message':'Account successfully logged',
      'body':(value.docs.length>0)?UserModel.fromJson(value.docs[0]).toJson():null
    };
  }
  static Future<Map<String,dynamic>> onValueFetchUserByUserName(value) async{
    return {
      'status':true,
      'message':'Account successfully logged',
      'body':(value.docs.length>0)?UserModel.fromJson(value.docs[0]).toJson():null
    };
  }
  static Future<Map<String,dynamic>> onValueFetchUserId(value) async{
    return {
      'status':true,
      'message':'Account successfully logged',
      'body':(value.docs.length>0)?UserModel.fromJson(value.docs[0]).toJson():null
    };
  }
  static Future<Map<String,dynamic>> onValueFetchUsers(value) async{
    print("Users count : ${value.docs.length}");

    return {
      'status':true,
      'message':'Users successfully fetch',
      'body':value.docs
    };
  }
  static Future<Map<String, dynamic>> onValueSendPasswordResetEmail(
      value) async {
    return {
      'status': true,
      'message': 'Email successfully send code ',
      'body': {}
    };
  }
  static Future<Map<String, dynamic>> onValueCheckCodeToResetPassword(
      value) async {
    return {
      'status': true,
      'message': 'تم التحقق من الرمز',
      'body': {}
    };
  }




  static Future<Map<String,dynamic>>onValueAddReport(value) async{
    return {
      'status':true,
      'message':'Report successfully add',
      'body':{},//{'id':value.id}
    };
  }
  static Future<Map<String,dynamic>>onValueUpdateReport(value) async{
    return {
      'status':true,
      'message':'Report successfully update',
      'body':{}
    };
  }
  static Future<Map<String,dynamic>> onValueFetchReports(value) async{
    return {
      'status':true,
      'message':'Reports successfully fetch',
      'body':value.docs
    };
  }
  static Future<Map<String,dynamic>>onValueDeleteReport(value) async{
    return {
      'status':true,
      'message':'Report successfully delete',
      'body':{}
    };
  }

  static Future<Map<String,dynamic>>onValueAddReview(value) async{
    return {
      'status':true,
      'message':'Review successfully add',
      'body':{},//{'id':value.id}
    };
  }
  static Future<Map<String,dynamic>>onValueUpdateProject(value) async{
    return {
      'status':true,
      'message':'Project successfully update',
      'body':{}
    };
  }
  static Future<Map<String,dynamic>> onValueFetchProjects(value) async{
    return {
      'status':true,
      'message':'Projects successfully fetch',
      'body':value.docs
    };
  }
  static Future<Map<String,dynamic>>onValueDeleteProject(value) async{
    return {
      'status':true,
      'message':'Project successfully delete',
      'body':{}
    };
  }


  static Future<Map<String, dynamic>> onValueUpdateRobotModel(value) async {
    return {
      'status': true,
      'message': 'Robot successfully update',
      'body': {}
    };
  }

  static Future<Map<String,dynamic>>onValueAddNotification(value) async{
    return {
      'status':true,
      'message':'Notification successfully add',
      'body':{}
    };
  }
  static Future<Map<String, dynamic>> onValueUpdateNotification(value) async {
    return {
      'status': true,
      'message': 'Notification successfully update',
      'body': {}
    };
  }
  static Future<Map<String,dynamic>>onValueAddActivity(value) async{
    return {
      'status':true,
      'message':'Activity successfully add',
      'body':{}
    };
  }

  static Future<Map<String,dynamic>>onValueAddAppointment(value) async{
    return {
      'status':true,
      'message':'Appointment successfully add',
      'body':{},//{'id':value.id}
    };
  }
  static Future<Map<String,dynamic>>onValueUpdateAppointment(value) async{
    return {
      'status':true,
      'message':'Appointment successfully update',
      'body':{}
    };
  }
  static Future<Map<String,dynamic>> onValueFetchAppointments(value) async{
    return {
      'status':true,
      'message':'Appointment successfully fetch',
      'body':value.docs
    };
  }
  static Future<Map<String,dynamic>>onValueDeleteAppointment(value) async{
    return {
      'status':true,
      'message':'Appointment successfully delete',
      'body':{}
    };
  }


  static Future<Map<String,dynamic>>onValueAddChat(value) async{
    return {
      'status':true,
      'message':'Chat successfully add',
      'body':{'id':value.id}
    };
  }
  static Future<Map<String,dynamic>>onValueUpdateChat(value) async{
    return {
      'status':true,
      'message':'Chat successfully update',
      'body':{}
    };
  }
  static Future<Map<String,dynamic>> onValueFetchChats(value) async{
    return {
      'status':true,
      'message':'Chats successfully fetch',
      'body':value.docs
    };
  }
  static Future<Map<String,dynamic>>onValueAddMessage(value) async{
    return {
      'status':true,
      'message':'Message successfully add',
      'body':{}
    };
  }
  static Future<Map<String,dynamic>>onValueDeleteChat(value) async{
    return {
      'status':true,
      'message':'Chat successfully delete',
      'body':{}
    };
  }
  static Future<Map<String,dynamic>>onValueDeleteMessage(value) async{
    return {
      'status':true,
      'message':'Message successfully delete',
      'body':{}
    };
  }
  static Future<Map<String,dynamic>> onValueFetchLastMessage(value) async{
    return {
      'status':true,
      'message':'Last message successfully fetch',
      'body':value.docs
    };
  }




  static String findTextToast(String text){
    String errorMessage='';
    print("error:$text");
    switch(text.toLowerCase()){
      // login
      case "user-not-found":
        errorMessage = "No user found with this email.";
        errorMessage = "لا يوجد مستخدم لهذا البريد.";
        break;
      case "wrong-password":
        errorMessage = "Incorrect password.";
        errorMessage = "كلمة السر غير صحيحة.";
        break;
      case "invalid-email":
        errorMessage = "البريد الالكتروني البدخل غير صالح";
        break;
      case "user-disabled":
        errorMessage = "المستخدم غير مفعل.";
        break;
      case "too-many-requests":
        errorMessage =
            errorMessage="Too many requests";
        ".حاولت تسجيل الدخول مرات عديدة، حاول لاحقاً";

        break;
      // register
      case "email-already-in-use":
        errorMessage="email already in use";
        errorMessage = ".هذا البريد موجود مسبقاً";

        break;
      case "invalid-email":
        errorMessage = "Invalid email";
        errorMessage = "البريد الالكتروني غير صالح.";

        break;
      case "weak-password":
        errorMessage = "Password is too weak. It must be at least 6 characters long, including at least one uppercase letter, one lowercase letter, and one digit.";
        errorMessage = "كلمة المرور ضعيفة، يجب أن تحوي 6 محارف، وتتضمن حرف كبير وحرف صغير، وأيضا علامة ترقيم";
        break;
      case "invalid email":

        errorMessage = "Invalid email";
        errorMessage = "البريد الالكتروني غير صالح.";
        break;
      case "invalid-credential":

        errorMessage = "Invalid credential";
        errorMessage = "المستخدم غير صحيح.";
        break;

      case "account successfully logged":

        errorMessage = "Account successfully logged";
        errorMessage =
        "تم تسجيل الدخول بنجاح";
        break;
      case "users successfully fetch":
        errorMessage =
        "تم جلب معلومات المستخدمين بنجاح";
        errorMessage = "Users successfully fetch";
        break;
      case "Report successfully add":
        errorMessage =
        "تمت إضافة مشكلة بنجاح";
        break;
      case "Report successfully update":
        errorMessage =
        "تم تحديث المشكلة بنجاح";
        break;
      case "Report successfully fetch":
        errorMessage =
        "تم جلب المشكلة بنجاح";
        break;
      case "account successfully created":
        errorMessage =
        "تم انشاء الحساب بنجاح";
        break;
      case "Report successfully delete":
        errorMessage =
        "تم حذف المشكلة بنجاح";
        break;
      case "":
        errorMessage =
        "";
        break;
      case "":
        errorMessage =
        "";
        break;
      case "":
        errorMessage =
        "";
        break;
      default:
        errorMessage = "حصل خطأ، الرجاء المحاولة لاحقاً";
        errorMessage = "An unexpected error occurred. Please try again later.";

        errorMessage = text;
    }
    print("error trans: $errorMessage");

    // if(text.contains("Password should be at least 6 characters")){
    //   return tr(LocaleKeys.toast_short_password);
    // }else if(text.contains("The email address is already in use by another account")){
    //   return tr(LocaleKeys.toast_email_already_use);
    // }
    // else if(text.contains("Account Unsuccessfully created")){
    //   return tr(LocaleKeys.toast_Unsuccessfully_created);
    // }
    // else if(text.contains("Account successfully created")){
    //    return tr(LocaleKeys.toast_successfully_created);
    // }
    // else if(text.contains("The password is invalid or the user does not have a password")){
    //    return tr(LocaleKeys.toast_password_invalid);
    // }
    // else if(text.contains("There is no user record corresponding to this identifier")){
    //    return tr(LocaleKeys.toast_email_invalid);
    // }
    // else if(text.contains("The email address is badly formatted")){
    //   return tr(LocaleKeys.toast_email_invalid);
    // }
    // else if(text.contains("Account successfully logged")){
    //     return tr(LocaleKeys.toast_successfully_logged);
    // }
    // else if(text.contains("A network error")){
    //    return tr(LocaleKeys.toast_network_error);
    // }
    // else if(text.contains("An internal error has occurred")){
    //   return tr(LocaleKeys.toast_network_error);
    // }else if(text.contains("field does not exist within the DocumentSnapshotPlatform")){
    //   return tr(LocaleKeys.toast_Bad_data_fetch);
    // }else if(text.contains("Given String is empty or null")){
    //   return tr(LocaleKeys.toast_given_empty);
    // }
    // else if(text.contains("time out")){
    //   return tr(LocaleKeys.toast_time_out);
    // }
    // else if(text.contains("Account successfully logged")){
    //   return tr(LocaleKeys.toast);
    // }
    // else if(text.contains("Account not Active")){
    //   return tr(LocaleKeys.toast_account_not_active);
    // }

    return errorMessage;
  }

  static Future uploadImage({required XFile image,  String folder='images'}) async {

    try{
      String path = image.name;
      File file =File(image.path);
      Reference storage = FirebaseStorage.instance.ref().child("${folder}/${path}");
      UploadTask storageUploadTask = storage.putFile(file);
      TaskSnapshot taskSnapshot = await storageUploadTask;
      String url = await taskSnapshot.ref.getDownloadURL();
      return url;
    }catch(e){
      String errorMessage;
      errorMessage = "An unexpected error occurred. Please try again later.";
      Get.back();
      Get.snackbar(
          "خطأ",
          errorMessage,
          backgroundColor: Colors.redAccent
      );
    }
  }

}

class FirebaseHelperFun {
  static Future<Map<String, dynamic>> onValueSignup(value) async {
    print(true);
    print("uid : ${value.user?.uid}");
    return {
      'status': true,
      'message': 'Account successfully created',
      'body': value.user
    };
  }

  static Future<Map<String, dynamic>> onTimeOut() async {
    print(false);
    return {
      'status': false,
      'message': 'time out',
      //'body':""
    };
  }

  static Future<Map<String, dynamic>> onError(error) async {
    print(false);
    print(error);
    var errorMessage;
    if (error is FirebaseAuthException) {
      errorMessage = error.message ?? "Firebase Authentication Error";
    } else if (error is FirebaseException) {
      errorMessage = error.message ?? "Firebase Error";
    } else {
      errorMessage = error;
    }

    return {
      'status': false,
      'message': errorMessage,
      //'body':""
    };
  }
}
