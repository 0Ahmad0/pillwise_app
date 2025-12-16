import 'dart:convert';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/core/widgets/app_app_bar_widget.dart';
import 'package:pillwise_app/app/core/widgets/app_button_widget.dart';
import 'package:pillwise_app/app/core/widgets/app_padding_widget.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

import '../../app/services/ExcelReaderService.dart';
import '../settings/presentation/controllers/settings_controller.dart';

class ExcelConverterScreen extends StatefulWidget {
  const ExcelConverterScreen({super.key});

  @override
  State<ExcelConverterScreen> createState() => _ExcelConverterScreenState();
}

class _ExcelConverterScreenState extends State<ExcelConverterScreen> {
  List<Map<String, dynamic>> drugsData = [];
  bool isLoading = false;
  String? fileName;
  String? filePath;
  String jsonOutput = '';
  int totalDrugs = 0;

  Future<void> pickExcelFile() async {
    setState(() {
      isLoading = true;
      drugsData.clear();
      jsonOutput = '';
    });

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx', 'xls'],
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        PlatformFile file = result.files.first;
        fileName = file.name;
        filePath = file.path;

        List<Map<String, dynamic>> data =
            await ExcelReaderService.readExcelFile(file.path!);

        Map<String, dynamic> jsonData = ExcelReaderService.convertToJson(data);

        setState(() {
          drugsData = data;
          jsonOutput = JsonEncoder.withIndent('  ').convert(jsonData);
          totalDrugs = drugsData.length;
        });

        Fluttertoast.showToast(
          msg: "تم تحويل $totalDrugs دواء بنجاح",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "خطأ: ${e.toString()}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> saveJsonFile() async {
    if (jsonOutput.isEmpty) return;

    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/drugs_output.json');
      await file.writeAsString(jsonOutput);

      await Share.shareXFiles(
        [XFile(file.path)],
        text: 'بيانات الأدوية المحولة',
        subject: 'JSON للأدوية',
      );

      Fluttertoast.showToast(
        msg: "تم حفظ ملف JSON",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "خطأ في الحفظ: ${e.toString()}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
      );
    }
  }

  Future<void> uploadJsonFile() async {
    if (jsonOutput.isEmpty) return;
    bulkUploadDrugsWithBatch(context, jsonOutput);
  }

  void copyToClipboard() {
    if (jsonOutput.isNotEmpty) {
      // يمكنك إضافة حزمة clipboard هنا إذا أردت
      Fluttertoast.showToast(
        msg: "JSON جاهز للحفظ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarWidget(
        title: tr(LocaleKeys.admin_admin_text),
        leadingIcon: IconButton(
            onPressed: () {
              Get.find<SettingsController>().logout();
            },
            icon: Icon(Icons.logout)),
      ),
      body: AppPaddingWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppButtonWidget(
              isLoading: isLoading,
              text: tr(LocaleKeys.admin_upload),
              onPressed: pickExcelFile,
            ),

            // معلومات الملف
            if (fileName != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      const Icon(Icons.insert_drive_file, color: Colors.blue),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              fileName!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            if (totalDrugs > 0)
                              Text(
                                '$totalDrugs ' + tr(LocaleKeys.admin_medicine),
                                style: TextStyle(
                                  color: Colors.green[700],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            const SizedBox(height: 16),

            if (jsonOutput.isNotEmpty)
              ElevatedButton.icon(
                onPressed: copyToClipboard,
                icon: const Icon(Icons.content_copy),
                label: Text(tr(LocaleKeys.admin_copy)),
              ),

            const SizedBox(height: 20),

            Expanded(
              child: jsonOutput.isEmpty
                  ? Center(
                      child: DottedBorder(
                        options: RectDottedBorderOptions(
                            strokeWidth: .5,
                            dashPattern: [5, 12],
                            strokeCap: StrokeCap.round),
                        child: AppPaddingWidget(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.table_chart,
                                size: 80,
                                color: Colors.grey[300],
                              ),
                              const SizedBox(height: 20),
                              Text(
                                tr(LocaleKeys.admin_admin_desc),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: SelectableText(
                          jsonOutput,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: jsonOutput.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: uploadJsonFile,
              icon: const Icon(Icons.upload),
              label: Text(tr(LocaleKeys.admin_upload)),
              backgroundColor: Colors.green,
            )
          : null,
    );
  }
}
