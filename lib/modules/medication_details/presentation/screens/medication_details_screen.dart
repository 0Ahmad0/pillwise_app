import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/core/theme/app_colors.dart';
import 'package:pillwise_app/app/core/widgets/app_app_bar_widget.dart';
import 'package:pillwise_app/app/core/widgets/app_image_picker_bottom_sheet.dart';
import 'package:pillwise_app/app/core/widgets/app_padding_widget.dart';
import 'package:pillwise_app/app/extension/opacity_extension.dart';
import 'package:pillwise_app/generated/locale_keys.g.dart';

import '../widgets/drug_details_card_widget.dart';

class Drug {
  final String id;
  final String tradeName;
  final String scientificName;
  final double price;
  final String form;
  final String route;
  final String storage;
  final String shelfLife;
  final String legalStatus;
  final String manufacturer;
  final String country;
  final int packageSize;

  Drug({
    required this.id,
    required this.tradeName,
    required this.scientificName,
    required this.price,
    required this.form,
    required this.route,
    required this.storage,
    required this.shelfLife,
    required this.legalStatus,
    required this.manufacturer,
    required this.country,
    required this.packageSize,
  });

  factory Drug.fromJson(String id, Map<String, dynamic> json) {
    return Drug(
      id: id,
      tradeName: json['trade_name'] ?? 'Unknown',
      scientificName: json['scientific_name'] ?? '',
      price: (json['public_price'] as num).toDouble(),
      form: json['pharmaceutical_form'] ?? '',
      route: json['administration_route'] ?? '',
      storage: json['storage_condition_arabic'] ?? '',
      shelfLife: "${json['shelf_life']} Month",
      legalStatus: json['technical_details']['legal_status'] ?? 'Unknown',
      manufacturer: json['logistics']['manufacturer_name'] ?? '',
      country: json['logistics']['manufacturer_country'] ?? '',
      packageSize: json['package_details']['package_size'] ?? 0,
    );
  }
}

// -------------------- 2. Dummy Data (البيانات التجريبية) --------------------
// قمنا بمحاكاة البيانات بناءً على الـ JSON الذي قدمته
final Map<String, dynamic> rawData = {
  "DRG_001": {
    "trade_name": "ORS New (50 SACHET)",
    "scientific_name": "SODIUM CHLORIDE, POTASSIUM CHLORIDE...",
    "public_price": 30.3,
    "pharmaceutical_form": "Powder for oral solution",
    "administration_route": "Oral use",
    "shelf_life": 36,
    "storage_condition_arabic": "يخزن تحت 25 درجة مئوية",
    "package_details": {"package_size": 50},
    "technical_details": {"legal_status": "OTC"},
    "logistics": {
      "manufacturer_name": "NATIONAL PHARMACEUTICAL IND.",
      "manufacturer_country": "Oman"
    }
  },
  "DRG_002": {
    "trade_name": "Panadol Extra",
    "scientific_name": "Paracetamol, Caffeine",
    "public_price": 12.5,
    "pharmaceutical_form": "Tablet",
    "administration_route": "Oral use",
    "shelf_life": 24,
    "storage_condition_arabic": "يخزن في مكان جاف",
    "package_details": {"package_size": 24},
    "technical_details": {"legal_status": "OTC"},
    "logistics": {"manufacturer_name": "GSK", "manufacturer_country": "Ireland"}
  },
  "DRG_003": {
    "trade_name": "Augmentin 1g",
    "scientific_name": "Amoxicillin, Clavulanic Acid",
    "public_price": 45.0,
    "pharmaceutical_form": "Tablet",
    "administration_route": "Oral use",
    "shelf_life": 18,
    "storage_condition_arabic": "يخزن تحت 25 درجة",
    "package_details": {"package_size": 14},
    "technical_details": {"legal_status": "Prescription Only"},
    // مثال لحالة مختلفة
    "logistics": {"manufacturer_name": "GSK", "manufacturer_country": "UK"}
  },
};

// -------------------- 3. Main Screen (الشاشة الرئيسية) --------------------
class MedicationDetailsScreen extends StatelessWidget {
  const MedicationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarWidget(
        title: tr(LocaleKeys.medicationDetails_details),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DrugDetailsCardWidget(drug: {
              "trade_name": "PANADREX 500 MG TAB",
              "scientific_name": "PARACETAMOL",
              "public_price": '5.05',
              "strength": '500',
              "strength_unit": "",
              "pharmaceutical_form": "Tablet",
              "administration_route": "Oral use",
              "shelf_life": '48',
              "storage_condition_arabic": "Store below 30\u00b0C ,  protect from Light",
              "package_details": {
                "size": null,
                "size_unit": null,
                "package_types": "Blister",
                "package_size": '24'
              },
              "technical_details": {
                "product_type": "Human",
                "drug_type": "Generic",
                "atc_code1": "N02BE01",
                "atc_code2": null,
                "legal_status": "OTC",
                "product_control": "Uncontrolled",
                "authorization_status": "Valid"
              },
              "logistics": {
                "marketing_company": "KUWAIT SAUDI PHARMACEUTICAL INDUSTRIES",
                "marketing_country": "Kuwait",
                "manufacturer_name": "KUWAIT SAUDI PHARMACEUTICAL INDUSTRIES",
                "manufacturer_country": "Kuwait",
                "secondary_package_manufacturer": null,
                "main_agent": "ZIMMO TRADING ESTABLISHMENT",
                "second_agent": "Cigalah Group",
                "third_agent": null,
                "distribute_area": "Pharmacy"
              },
              "ids": {
                "register_number": '2511246335',
                "reference_number": "HG00354-00-00-00-381",
                "old_register_number": "1-352-00",
                "description_code": "7000000961-500-100000073664",
                "last_update": '45673.58647'
              }
            },)
          ],
        ),
      ),
    );
  }
}





