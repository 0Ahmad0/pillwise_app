// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "core": {
    "yes": "Yes",
    "no": "No",
    "get_started": "Get Started"
  },
  "welcome": {
    "welcome_text_app": "Welcome To PillWise",
    "welcome_description": "track, Scan, and find the right dosage for you"
  },
  "onboarding": {
    "title1": "Smart medication reminders",
    "sub_title1": "Don't miss a dose again. Get accurate and direct alerts for your medication times and stay up-to-date with your health schedule.",
    "title2": "Easy prescription scanning",
    "sub_title2": "Join studies or register your health attendance easily. Just scan the QR code and you'll be ready to go in seconds.",
    "title3": "Personalised health insights",
    "sub_title3": "Understand your health more deeply. Receive personalized tips and statistics based on your data and daily progress."
  }
};
static const Map<String,dynamic> _en = {
  "core": {
    "yes": "Yes",
    "no": "No",
    "get_started": "Get Started",
    "skip": "Skip",
    "next": "Next"
  },
  "welcome": {
    "welcome_text_app": "Welcome To PillWise",
    "welcome_description": "track, Scan, and find the right dosage for you"
  },
  "onboarding": {
    "title1": "Smart medication reminders",
    "sub_title1": "Don't miss a dose again. Get accurate and direct alerts for your medication times and stay up-to-date with your health schedule.",
    "title2": "Easy prescription scanning",
    "sub_title2": "Join studies or register your health attendance easily. Just scan the QR code and you'll be ready to go in seconds.",
    "title3": "Personalised health insights",
    "sub_title3": "Understand your health more deeply. Receive personalized tips and statistics based on your data and daily progress."
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
