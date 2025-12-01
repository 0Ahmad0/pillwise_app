import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:pillwise_app/app/bindings/initial_binding.dart';
import 'package:pillwise_app/app/core/constants/app_constants.dart';
import 'package:pillwise_app/app/routes/app_pages.dart';
import 'package:pillwise_app/app/routes/app_routes.dart';

import 'app/core/theme/app_theme.dart';
import 'firebase_options.dart';
import 'generated/codegen_loader.g.dart';
import 'modules/profile/presentation/controllers/profile_controller.dart';
import 'modules/settings/presentation/controllers/settings_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
    GetStorage.init(),
    EasyLocalization.ensureInitialized(),
    ScreenUtil.ensureScreenSize(),
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]),

    // GoogleSignIn.instance.initialize(
    //   clientId: "509780797338-rdnopskiakoavqam554l8t5mvm0r7j8e.apps.googleusercontent.com",
    //   serverClientId: "509780797338-rdnopskiakoavqam554l8t5mvm0r7j8e.apps.googleusercontent.com",
    // )
  ]);
  Get.put(SettingsController(), permanent: true);
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale(AppConstants.ar),
        Locale(AppConstants.en),
      ],
      path: AppConstants.translationPath,
      assetLoader: const CodegenLoader(),
      fallbackLocale: const Locale(AppConstants.ar),
      child: const PillWiseApp(),
    ),
  );
}

class PillWiseApp extends StatelessWidget {
  const PillWiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController settingsController = Get.find();
    return ScreenUtilInit(
      designSize: const Size(AppConstants.designWidth, AppConstants.designHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Obx((){
          return GetMaterialApp(
            theme: AppTheme.lightTheme,
            // <--- تطبيق الثيم الأبيض
            darkTheme: AppTheme.darkTheme,
            // <--- تطبيق الثيم الأسود
            themeMode: settingsController.themeMode.value,
            // (أو .light أو .dark)
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            defaultTransition: Transition.leftToRightWithFade,
            debugShowCheckedModeBanner: false,
            getPages: AppPages.routes,
            initialBinding: InitialBinding(),
            initialRoute: AppRoutes.login,
          );
        });
      },
    );
  }
}
