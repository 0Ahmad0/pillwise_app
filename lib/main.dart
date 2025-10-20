import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/routes/app_pages.dart';
import 'package:pillwise_app/app/routes/app_routes.dart';

import 'app/core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PillWiseApp());
}

class PillWiseApp extends StatelessWidget {
  const PillWiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.lightTheme,     // <--- تطبيق الثيم الأبيض
      darkTheme: AppTheme.darkTheme, // <--- تطبيق الثيم الأسود
      themeMode: ThemeMode.light, // (أو .light أو .dark)
      getPages: AppPages.routes,
      initialRoute: AppRoutes.initial,
    );
  }
}
