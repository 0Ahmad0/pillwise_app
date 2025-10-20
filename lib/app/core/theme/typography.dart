import 'package:flutter/material.dart';

class AppTypography {
  // static TextTheme textTheme = GoogleFonts.cairoTextTheme();

  static const TextTheme textTheme = TextTheme(
    // --- للعناوين الكبيرة (مثال: شاشة البداية)
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),

    // --- للعناوين (مثال: عنوان الصفحة)
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),

    // --- للنصوص الأساسية (مثال: الفقرات)
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),

    // --- للنصوص الثانوية (مثال: تاريخ، وصف قصير)
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),

    // --- لنصوص الأزرار
    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  );
}
