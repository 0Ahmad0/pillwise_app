import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';


class ExcelReaderService {
  
  // دالة لقراءة ملف Excel
  static Future<List<Map<String, dynamic>>> readExcelFile(String filePath) async {
    try {
      File file = File(filePath);
      List<int> bytes = await file.readAsBytes();
      
      Excel excel = Excel.decodeBytes(bytes);
      
      List<Map<String, dynamic>> data = [];
      
      // نأخذ أول sheet
      String sheetName = excel.tables.keys.first;
      final table = excel.tables[sheetName]!;
      
      if (table.rows.isEmpty) return data;
      
      // العناوين (الصف الأول)
      List<String> headers = [];
      for (var cell in table.rows[0]) {
        headers.add(cell?.value?.toString() ?? '');
      }
      
      // قراءة البيانات
      for (int i = 1; i < table.rows.length; i++) {
        Map<String, dynamic> rowData = {};
        for (int j = 0; j < headers.length; j++) {
          if (j < table.rows[i].length) {
            String header = headers[j].trim();
            dynamic cellValue = table.rows[i][j]?.value;
            rowData[header] = cellValue?.toString() ?? '';
          }
        }
        
        // تجاهل الصفوف الفارغة
        if (rowData.isNotEmpty && rowData.values.any((value) => value.toString().isNotEmpty)) {
          data.add(rowData);
        }
      }
      
      return data;
    } catch (e) {
      throw Exception('خطأ في قراءة ملف Excel: $e');
    }
  }
  
  // دالة لتحويل البيانات إلى JSON بالهيكل المطلوب
  static Map<String, dynamic> convertToJson(List<Map<String, dynamic>> rawData) {
    Map<String, dynamic> finalJson = {};
    
    for (int i = 0; i < rawData.length; i++) {
      Map<String, dynamic> row = rawData[i];
      
      Map<String, dynamic> structuredDrug = {
        "trade_name": row["trade_name"] ?? row["Trade Name"] ?? row["اسم التجاري"] ?? "",
        "scientific_name": row["scientific_name"] ?? row["Scientific Name"] ?? row["الاسم العلمي"] ?? "",
        "public_price": _parseDouble(row["public_price"] ?? row["Public Price"] ?? row["السعر"]),
        "strength": row["strength"] ?? row["Strength"] ?? row["التركيز"] ?? "",
        "strength_unit": row["strength_unit"] ?? row["StrengthUnit"] ?? row["وحدة التركيز"] ?? "",
        "pharmaceutical_form": row["pharmaceutical_form"] ?? row["PharmaceuticalForm"] ?? row["الشكل الصيدلاني"] ?? "",
        "administration_route": row["administration_route"] ?? row["AdministrationRoute"] ?? row["طريقة الاستخدام"] ?? "",
        "shelf_life": _parseInt(row["shelf_life"] ?? row["ShelfLife"] ?? row["مدة الصلاحية"]),
        "storage_condition_arabic": row["storage_condition_arabic"] ?? 
            row["Storage conditions"] ?? row["ظروف التخزين"] ?? "",
            // row["Storage Condition Arabic"] ?? row["ظروف التخزين"] ?? "",

        "package_details": {
          "size": _parseDouble(row["size"] ?? row["Size"] ?? row["الحجم"]),
          "size_unit": row["size_unit"] ?? row["SizeUnit"] ?? row["وحدة الحجم"],
          "package_types": row["package_types"] ?? row["PackageTypes"] ?? row["نوع العبوة"] ?? "",
          "package_size": _parseInt(row["package_size"] ?? row["PackageSize"] ?? row["حجم العبوة"]),
        },
        
        "technical_details": {
          "product_type": row["product_type"] ?? row["Product Type"] ?? row["نوع المنتج"] ?? "Human",
          "drug_type": row["drug_type"] ?? row["DrugType"] ?? row["نوع الدواء"] ?? "Generic",
          "atc_code1": row["atc_code1"] ?? row["ATCCode1"] ?? row["كود ATC1"] ?? "",
          "atc_code2": row["atc_code2"] ?? row["ATCCode2"] ?? row["كود ATC2"],
          "legal_status": row["legal_status"] ?? row["Legal Status"] ?? row["الحالة القانونية"] ?? "Prescription",
          "product_control": row["product_control"] ?? row["Product Control"] ?? row["رقابة المنتج"] ?? "Uncontrolled",
          "authorization_status": row["authorization_status"] ?? 
              row["Authorization Status"] ?? row["حالة الترخيص"] ?? "Valid",
        },
        
        "logistics": {
          "marketing_company": row["marketing_company"] ?? row["Marketing Company"] ?? row["شركة التسويق"] ?? "",
          "marketing_country": row["marketing_country"] ?? row["Marketing Country"] ?? row["بلد التسويق"] ?? "",
          "manufacturer_name": row["manufacturer_name"] ?? row["Manufacture Name"] ?? row["اسم المصنع"] ?? "",
          "manufacturer_country": row["manufacturer_country"] ?? row["Manufacture Country"] ?? row["بلد التصنيع"] ?? "",
          "secondary_package_manufacturer": row["secondary_package_manufacturer"] ?? 
              row["Secondry package  manufacture"] ?? row["مصنع العبوة الثانوية"],
          "main_agent": row["main_agent"] ?? row["Main Agent"] ?? row["الوكيل الرئيسي"] ?? "",
          "second_agent": row["second_agent"] ?? row["Secosnd Agent"] ?? row["الوكيل الثاني"],
          "third_agent": row["third_agent"] ?? row["Third Agent"] ?? row["الوكيل الثالث"],
          "distribute_area": row["distribute_area"] ?? row["Distribute Area"] ?? row["منطقة التوزيع"] ?? "Pharmacy",
        },
        
        "ids": {
          "register_number": row["register_number"] ?? row["RegisterNumber"] ?? row["رقم التسجيل"] ?? "",
          "reference_number": row["reference_number"] ?? row["ReferenceNumber"] ?? row["الرقم المرجعي"],
          "old_register_number": row["old_register_number"] ?? row["OldRegisterNumber"] ?? row["رقم التسجيل القديم"],
          "description_code": row["description_code"] ?? row["Description Code"] ?? row["كود الوصف"] ?? "",
          "last_update": row["last_update"] ?? row["Last Update"] ?? row["آخر تحديث"],
        }
      };
      
      // تنظيف القيم الفارغة
      _cleanEmptyValues(structuredDrug);
      
      finalJson["DRG_${(i + 1).toString().padLeft(3, '0')}"] = structuredDrug;
    }
    
    return finalJson;
  }
  
  // دوال مساعدة للتحويل
  static double? _parseDouble(dynamic value) {
    if (value == null || value.toString().isEmpty) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      String cleaned = value.replaceAll(',', '').trim();
      return double.tryParse(cleaned);
    }
    return null;
  }
  
  static int? _parseInt(dynamic value) {
    if (value == null || value.toString().isEmpty) return null;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) {
      String cleaned = value.replaceAll(',', '').trim();
      // إزالة النصوص مثل "month" أو "شهر"
      cleaned = cleaned.replaceAll(RegExp(r'[^0-9.]'), '');
      return int.tryParse(cleaned.split('.')[0]);
    }
    return null;
  }
  
  // تنظيف القيم الفارغة
  static void _cleanEmptyValues(Map<String, dynamic> map) {
    map.removeWhere((key, value) {
      if (value == null) return true;
      if (value is String && value.isEmpty) return true;
      if (value is Map) {
        _cleanEmptyValues(value as Map<String, dynamic>  );
        return value.isEmpty;
      }
      return false;
    });
  }
  
  // دالة لإنشاء نموذج Excel فارغ
  static Future<String> createExcelTemplate() async {
    List<List<String>> data = [
      [
        'Trade Name',
        'Scientific Name',
        'Public Price',
        'Strength',
        'Strength Unit',
        'Pharmaceutical Form',
        'Administration Route',
        'Shelf Life',
        'Storage Condition Arabic',
        'Size',
        'Size Unit',
        'Package Types',
        'Package Size',
        'Product Type',
        'Drug Type',
        'ATC Code1',
        'ATC Code2',
        'Legal Status',
        'Product Control',
        'Authorization Status',
        'Marketing Company',
        'Marketing Country',
        'Manufacturer Name',
        'Manufacturer Country',
        'Secondary Package Manufacturer',
        'Main Agent',
        'Second Agent',
        'Third Agent',
        'Distribute Area',
        'Register Number',
        'Reference Number',
        'Old Register Number',
        'Description Code',
        'Last Update',
      ],
      [
        'BIOSOFT EYE DROP',
        'SODIUM HYALURONATE',
        '31.1',
        '0.2',
        '%',
        'Eye drops',
        'Ophthalmic use',
        '24',
        'يحفظ في درجة حرارة الغرفة ( بحيث لا تتجاوز 30 درجة مئوية )',
        '10',
        'ml',
        'Bottle',
        '1',
        'Human',
        'Generic',
        'S01KA01',
        '',
        'OTC',
        'Uncontrolled',
        'Valid',
        'Oy Finnsusp Ab',
        'Finland',
        'Oy Finnsusp Ab',
        'Finland',
        '',
        'ZIMMO TRADING ESTABLISHMENT',
        '',
        '',
        'Pharmacy',
        '2-5210-18',
        '',
        '',
        '7000001158-0.2-200000016460',
        '44802.42049',
      ],
    ];
    
    try {
      Excel excel = Excel.createExcel();
      Sheet sheet = excel['الأدوية'];
      
      for (int i = 0; i < data.length; i++) {
        for (int j = 0; j < data[i].length; j++) {
          sheet.cell(CellIndex.indexByColumnRow(columnIndex: j, rowIndex: i)).value =TextCellValue(data[i][j]) ;
        }
      }
      
      List<int>? bytes = excel.save();
      if (bytes != null) {
        final directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/drugs_template.xlsx');
        await file.writeAsBytes(bytes);
        return file.path;
      }
      
      throw Exception('فشل في إنشاء ملف Excel');
    } catch (e) {
      throw Exception('خطأ في إنشاء النموذج: $e');
    }
  }
}


Future<void> bulkUploadDrugsWithBatch(BuildContext context,  String jsonString) async {
  try {
    // 1. قراءة الملف
    // String jsonString = await rootBundle.loadString('assets/structured_drugs_data.json');
    Map<String, dynamic> drugsMap = json.decode(jsonString);

    final firestore = FirebaseFirestore.instance;

    // 2. إنشاء دفعة الكتابة (Write Batch)
    final batch = firestore.batch();

    CollectionReference drugsCollection = firestore.collection('drugs_app');
    int uploadedCount = 0;

    // 3. إضافة كل عملية كتابة إلى الدفعة
    for (var entry in drugsMap.entries) {
      String drugId = entry.key;
      Map<String, dynamic> drugData = entry.value as Map<String, dynamic>;

      // هنا نقوم بإضافة العملية إلى الدفعة، ولكن لا نرسلها بعد
      batch.set(drugsCollection.doc(drugId), drugData);
      uploadedCount++;
    }

    // 4. تنفيذ الدفعة (Commit) بطلب شبكة واحد
    await batch.commit();

    // 5. إظهار رسالة نجاح
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('✅ تم رفع $uploadedCount دواء بنجاح في دفعة واحدة إلى Firestore!')),
    );

  } catch (e) {
    // 6. إظهار رسالة خطأ
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('❌ حدث خطأ في عملية الرفع الجماعي: $e')),
    );
  }
}