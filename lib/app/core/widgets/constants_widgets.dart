import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/core/theme/app_colors.dart';
import '../../../generated/locale_keys.g.dart';
import '../constants/strings.dart';




class ConstantsWidgets {

  static circularProgress()  {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
    static showLoading() async {
    return
    //   showDialog(
    //       context: context,
    //       barrierDismissible: false, // Prevents dialog from being dismissed by tapping outside
    //       builder: (BuildContext context) {
    //   return PopScope(
    //     canPop:true
    //     ,
    //     child: Center(
    //       child: Container(
    //         width: 80,
    //         height: 80,
    //         padding: const EdgeInsets.all(10.0),
    //         decoration: BoxDecoration(
    //           color: ColorsManager.whiteColor,
    //           borderRadius: BorderRadius.circular(8.0),
    //         ),
    //         child:
    //
    //         Center(
    //             child:  CircularProgressIndicator(
    //               color: ColorsManager.primaryColor,
    //             )),
    //       ),
    //     ),
    //   );});



      await Get.dialog(
        PopScope(
          canPop:true
          ,
          child:
          Center(
            child: Container(
              width: 80,
              height: 80,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child:

              Center(
                  child:  CircularProgressIndicator(
                    color: AppColors.primary,
                  )),
            ),
          ),
        ),
        barrierDismissible: false,
      );
    }

  static closeDialog() async {
    Get.close(1);
    // context.pop();

  }
  static showProgress(double progress)  {
    return
      // await Get.dialog(
      PopScope(
        canPop:true
        ,
        child: Center(
          child: Container(
             width: 100,
             height: 100,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child:  CircularProgressIndicator(
                      color: AppColors.primary,
                    )),
                SizedBox(height:10.h,),
                Text('${(progress*100).toInt()}%',style: TextStyle(fontSize: 14,
                    // color:
                // ColorsManager.textFieldColor
                ),)
              ],
            ),
          ),
        ),
      );
    //   barrierDismissible: false,
    // );
  }
  static TOAST(BuildContext? context, {String? title,String textToast = "This Is Toast",bool? state}) {
    title??=state==null?tr(LocaleKeys.success):state?tr(LocaleKeys.success):tr(LocaleKeys.error);

    // title??=state==null?Strings.message_success:state?Strings.message_success:Strings.message_failure;
    Get.snackbar(title, textToast,
        backgroundColor: state==null?null:state?Colors.green:Colors.redAccent,
        colorText:  AppColors.white);
    // showToast(
    //     textToast,
    //     context: context,
    //     animation: StyledToastAnimation.fadeScale,
    //     position: StyledToastPosition.top,
    //     textStyle: TextStyle(color: ColorsManager.whiteColor)
    // );
  }

  static emptyWidget(context,{text='No Data Yet!'})=>Center(
    child: Text(text,style: TextStyle(
        fontSize: MediaQuery.of(context).size.width * 0.06,
        fontWeight: FontWeight.bold
    ),),
  );
}
