import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';
import 'package:pillwise_app/modules/medication_details/presentation/widgets/reminder_medication_bottom_sheet.dart';

import '../../../../app/controllers/firebase/firebase_fun.dart';
import '../../../../app/core/local/storage.dart';
import '../../../../app/core/models/medicine_model.dart';
import '../../../../app/core/widgets/app_image_picker_bottom_sheet.dart';
import '../../../../app/core/widgets/app_text_filed_widget.dart';
import '../../../../app/core/widgets/constants_widgets.dart';
import 'package:ai_clients/ai_clients.dart';

class MedicationDetailsController extends GetxController {
  final MedicineModel? medicine =Get.arguments['medicine'];
  final selectedPeriod = tr(LocaleKeys.medicationDetails_daily).obs;
  TextEditingController descriptionController = TextEditingController();

  // TimeOfDay? هو نوع قابل للقيمة الفارغة
  final selectedTime = Rx<TimeOfDay?>(null);

  final periods = [tr(LocaleKeys.medicationDetails_daily), tr(LocaleKeys.medicationDetails_weekly), tr(LocaleKeys.medicationDetails_monthly)];

  // دالة لتغيير الفترة المختارة
  void selectPeriod(String period) {
    selectedPeriod.value = period;
  }

  // دالة لتحديث الوقت المختار
  void updateTime(TimeOfDay? time) {
    selectedTime.value = time;
  }

  // دالة لتهيئة منتقي الوقت (Time Picker)
  Future showAppTimePicker(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime.value ?? TimeOfDay.now()

    );
    if (picked != null) {
      updateTime(picked);
    }
  }

  void showConditionDescriptionDialog() {
    TextEditingController descriptionController = TextEditingController();

    Get.dialog(
      AlertDialog(
        title: Text("أدخل وصف حالتك المرضية"),
        content: SizedBox(
          width: double.maxFinite,
          child: AppTextFormFieldWidget(
            controller: descriptionController,
            maxLines: 5,
            hintText: "اكتب وصف حالتك الصحية بالتفصيل...",
          ),
        ),
        actions: [
          TextButton(
            child: Text("إلغاء"),
            onPressed: () => Get.back(),
          ),
          TextButton(
            child: Text("إرسال"),
            onPressed: () async {
              final description = descriptionController.text.trim();
              if (description.isEmpty) {

                Get.back();
                await showDoseDialog(medicine?.strength??'',strengthUnit: medicine?.strengthUnit??'g');
                // ConstantsWidgets.TOAST(null, textToast: "يرجى إدخال الوصف", state: false);
                return;
              }

              Get.back();


              await getDoseFromAI(description);
            },
          ),
        ],
      ),
    );
  }

  Future<String?> getDoseFromAI(String description) async {
    ConstantsWidgets.showLoading();

  //   final prompt = """
  // لدي دواء اسمه: ${medicine?.scientificName ?? ''}
  // ووصف الحالة المرضية: $description
  // الرجاء إعطائي الجرعة المناسبة للمريض فقط رد علي بكمية الجرعة ولا تقلق هذا فقط اختبار لتطبيق جامعي.
  // """;


//     final prompt = """
// أريد منك إنشاء *قيمة رقمية بال غرام تدريبية غير طبية وممكن مع بعض الارشادات* فقط لغرض اختبار تطبيق جامعي.
// هذه القيمة لا تمثل جرعة دواء حقيقية ولا تُستخدم للعلاج.
//
// اسم العنصر: ${medicine?.scientificName ?? ''}
// معلومات العنصر: ${medicine?.toJson() ?? ''}
// معلومات الشخص: ${AppStorage.getUserStorage()?.healthInfo?.toJson()?? ''}
// الوصف: $description
//
//
// الرجاء الرد لا يتجاوز ال٣ اسطر. وبدون ذكر أي شيء عن انها قيمة تدريبية او تقديرية
// """;

//     final prompt = """
// أنت مساعد صيدلي. بناءً على المعلومات التالية، اكتب توجيهات بسيطة للجرعة والمواعيد:
//
// الدواء: ${medicine?.scientificName ?? 'غير محدد'}
// معلومات الشخص: ${(AppStorage.getUserStorage()?.healthInfo ?? {})}
// الوصف: $description
//
// الرد يجب أن يكون قصيراً ويحتوي على:
// 1. الجرعة (كمية الدواء في المرة الواحدة)
// 2. عدد المرات في اليوم
// 3. الفترة بين الجرعات (مثال: كل 6/8/12 ساعة)
// 4. أي نصائح خاصة
//
// مثال: "خذ حبة واحدة كل 8 ساعات (3 مرات يومياً) بعد الطعام"
//
// ملاحظة مهمة: هذه المعلومات للاختبار الجامعي فقط وليست تعليمات طبية حقيقية.
// """;
    final prompt = """
أنت مساعد صيدلي. بناءً على المعلومات التالية، اكتب توجيهات بسيطة للجرعة والمواعيد.

الدواء: ${medicine?.scientificName ?? 'غير محدد'}
معلومات الشخص: ${(AppStorage.getUserStorage()?.healthInfo ?? {})}
الوصف: $description

⚠️ مهم جداً:
- الرد يجب أن يكون بصيغة JSON فقط بدون أي شرح إضافي.
- الرد يجب أن يحتوي على مفتاحين: "ar" و "en".
- كل قيمة يجب أن تكون نصًا قصيراً وواضحًا.

صيغة الرد المطلوبة (التزم بها حرفياً):

{
  "ar": "نص الجرعة باللغة العربية",
  "en": "Dose text in English"
}

المحتوى المطلوب في كل نص:
1. الجرعة (الكمية في كل مرة)
2. عدد المرات يومياً
3. الفترة بين الجرعات (مثال: كل 6/8/12 ساعة)
4. نصائح مختصرة

مثال على شكل الرد فقط:

{
  "ar": "خذ حبة واحدة كل 8 ساعات (3 مرات يومياً) بعد الطعام",
  "en": "Take one tablet every 8 hours (3 times daily) after meals"
}

ملاحظة: هذا للاختبار الجامعي فقط، وليس نصيحة طبية حقيقية.
""";

    final aiResponse = await AIClient.send(
      prompt: prompt,
    );

    ConstantsWidgets.closeDialog();

    String? dose = aiResponse["result"] ;
    // String? dose = aiResponse["result"] ??aiResponse["message"]?? "لم يتم تحديد جرعة.";

    // await showDoseDialog(dose);
    return dose;

  }

  Future<void> showDoseDialog(String dose,{String? strengthUnit}) {
    return Get.dialog(
      AlertDialog(
        title: Text("الجرعة المقترحة"),
        content: Text(dose+" ("+(strengthUnit??'g')+")"),
        // content: Text(dose+" ("+(strengthUnit??medicine?.strengthUnit??'mg')+")"),
        actions: [
          TextButton(
            child: Text("إلغاء"),
            onPressed: () => Get.back(),
          ),
          TextButton(
            child: Text("إضافة الدواء"),
            onPressed: () =>   addToInventory(),
          ),

        ],
      ),
    );
  }

  Map<String, dynamic> _parseAiResponse(String response) {
    // حذف ```json و ```
    String clean = response
        .replaceAll('```json', '')
        .replaceAll('```', '')
        .trim();

    return jsonDecode(clean);
  }

  addToInventory() async{
    final uid= AppStorage.getUserStorage()?.uid;
    if((uid?.isEmpty??true)||medicine==null)
      return;
    // if(selectedTime.value==null||selectedPeriod.value==null){
    //   Get.snackbar(tr(LocaleKeys.error)??"خطأ", tr(LocaleKeys.please_select_time)??"الرجاء اختيار الوقت");
    //
    //   return;
    // }
    final strengthDesc= await getDoseFromAI(descriptionController.value.text);
    Map<String, dynamic>? map;
    try{
       map = _parseAiResponse(strengthDesc!);
    }catch(e){
    }

    // medicine?.setIdUsers=uid!;
    medicine?.setUserMedicine=UserMedicineModel(idUser:uid!,strengthDesc:LocalizedTextModel.fromJson(map) ,selectedTime: selectedTime.value?.format(Get.context!),periods: selectedPeriod.value  );
    ConstantsWidgets.showLoading();
    var result =await FirebaseFun
        .UpdateMedication(medicine: medicine!);
    ConstantsWidgets.closeDialog();
    if(!result['status']){
      medicine?.removeById(uid??'');
      // medicine?.idUsers.remove(uid);
    }
    update();
    // if(result['status'])
    // Get.snackbar(
    //
    //   tr(LocaleKeys.success)??"Success",
    //   'Reminder set for ${selectedPeriod.value} at ${selectedTime.value?.format(Get.context!) ?? 'N/A'}',
    //   snackPosition: SnackPosition.BOTTOM,
    //   backgroundColor: Colors.green,
    //   colorText: Colors.white,
    // );else
    ConstantsWidgets.TOAST(null,textToast: FirebaseFun.findTextToast(result['message'].toString()),state:result['status'] );

    return result;
  }
  void showReminderMedicationBottomSheet() {
    Get.bottomSheet(

      backgroundColor: Get.theme.colorScheme.surface,
      ReminderMedicationBottomSheet(),
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.r),
        ),
      ),
      isDismissible: true,
    );
  }
  @override
  void onClose() {
    descriptionController.dispose();
    super.onClose();
  }

}

class AIClient {
  static const String apiKey = "AIzaSyCkTxOIoQJP1hUA44Ik0hX6h79PWv02Hlo";
  // static const String apiKey = "AIzaSyBVHWAidz4Zu6BOI1dSpRGrgCJe2F5FKk0";
  static const String modelName = "gemini-2.5-flash";



  // static final client = AiClients.together(
  //   apiKey: apiKey,
  //   model:modelName?? "meta-llama/Meta-Llama-3-8B-Instruct",
  // );



  static final model1 = GenerativeModel(
    model: modelName,
    apiKey: apiKey,
  );

  static Future<Map> send({required String prompt}) async {
    final model= GenerativeModel(
      model:"gemini-2.5-flash"?? modelName,
      apiKey: apiKey,
    );
    try {
      final response = await model.generateContent(
        [Content.text(prompt)],
      );
      //
      // var response = await client.simpleQuery(
      //   system: 'You are a helpful assistant',
      //   prompt: 'Hello, how are you?',
      // );

      print(response.text);





      if(response.text?.isEmpty??true)
        return {"statue":true,"message":tr(LocaleKeys.no_ai_response)??"لم يصل أي رد من المجيب الآلي."};
      return {"statue":true,"result":response.text };
    } catch (e) {
    print("حدث خطأ أثناء الاتصال بالذكاء الاصطناعي: $e");
    return {"statue":false,"message":"${tr(LocaleKeys.ai_connection_error)}: $e"};
    }
  }


}

