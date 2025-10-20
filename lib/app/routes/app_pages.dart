import 'package:get/get.dart';
import 'package:pillwise_app/modules/auth/presentation/screens/signup_screen.dart';
import 'package:pillwise_app/modules/splash/presentation/bindings/splash_binding.dart';

import '../../modules/auth/presentation/screens/login_screen.dart';
import '../../modules/splash/presentation/screens/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.initial,
      page: () => SplashScreen(),
      binding: SplashBinding(), // الربط بالـ Binding الخاص بالصفحة
    ),

    ///Auth Screens
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignupScreen(),
    ),
  ];
}
