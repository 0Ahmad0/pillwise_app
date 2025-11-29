import 'package:get/get.dart';
import 'package:pillwise_app/modules/add_medication/presentation/bindings/add_medication_binding.dart';
import 'package:pillwise_app/modules/add_medication/presentation/screens/add_medication_screen.dart';
import 'package:pillwise_app/modules/auth/presentation/screens/signup_screen.dart';
import 'package:pillwise_app/modules/edit_profile/presentation/bindings/edit_profile_binding.dart';
import 'package:pillwise_app/modules/edit_profile/presentation/screens/edit_profile_screen.dart';
import 'package:pillwise_app/modules/health_information/presentation/bindings/health_information_binding.dart';
import 'package:pillwise_app/modules/health_information/presentation/screens/health_information_screen.dart';
import 'package:pillwise_app/modules/home/presentation/screens/home_screen.dart';
import 'package:pillwise_app/modules/navbar/presentation/bindings/navbar_binding.dart';
import 'package:pillwise_app/modules/navbar/presentation/screens/navbar_screen.dart';
import 'package:pillwise_app/modules/splash/presentation/bindings/splash_binding.dart';
import 'package:pillwise_app/modules/welcome/presentation/bindings/welcome_binding.dart';
import 'package:pillwise_app/modules/welcome/presentation/screens/welcome_screen.dart';

import '../../modules/auth/presentation/bindings/forget_password_binding.dart';
import '../../modules/auth/presentation/bindings/login_binding.dart';
import '../../modules/auth/presentation/bindings/signup_binding.dart';
import '../../modules/auth/presentation/screens/forget_password_screen.dart';
import '../../modules/auth/presentation/screens/login_screen.dart';
import '../../modules/contact_us/presentation/bindings/contact_us_binding.dart';
import '../../modules/contact_us/presentation/screens/contact_us_screen.dart';
import '../../modules/help_support/presentation/bindings/help_support_binding.dart';
import '../../modules/help_support/presentation/screens/help_support_screen.dart';
import '../../modules/home/presentation/bindings/home_binding.dart';
import '../../modules/onboarding/presentation/bindings/onboarding_binding.dart';
import '../../modules/onboarding/presentation/screens/onboarding_screen.dart';
import '../../modules/privacy_policy/presentation/bindings/privacy_policy_binding.dart';
import '../../modules/privacy_policy/presentation/screens/privacy_policy_screen.dart';
import '../../modules/profile/presentation/bindings/profile_binding.dart';
import '../../modules/profile/presentation/screens/profile_screen.dart';
import '../../modules/scan_barcode/presentation/bindings/scan_barcode_binding.dart';
import '../../modules/scan_barcode/presentation/screens/scan_barcode_screen.dart';
import '../../modules/settings/presentation/bindings/settings_binding.dart';
import '../../modules/settings/presentation/screens/settings_screen.dart';
import '../../modules/splash/presentation/screens/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.initial,
      page: () => const SplashScreen(),
      binding: SplashBinding(), // الربط بالـ Binding الخاص بالصفحة
    ),

    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomeScreen(),
      binding: WelcomeBinding(), // الربط بالـ Binding الخاص بالصفحة
    ),

    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
      binding: OnboardingBinding(),
    ),

    ///Auth Screens
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(), // <-- يستخدم LoginBinding
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupScreen(),
      binding: SignupBinding(), // <-- يستخدم SignupBinding
    ),
    GetPage(
      name: AppRoutes.forgetPassword,
      page: () => const ForgetPasswordScreen(),
      binding: ForgetPasswordBinding(), // <-- يستخدم ForgetPasswordBinding
    ),

    GetPage(
      name: AppRoutes.navbar,
      page: () => const NavbarScreen(),
      binding: NavbarBinding(), // <-- يستخدم ForgetPasswordBinding
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(), // <-- يستخدم ForgetPasswordBinding
    ),
    GetPage(
      name: AppRoutes.addMedication,
      page: () => const AddMedicationScreen(),
      binding: AddMedicationBinding(), // <-- يستخدم ForgetPasswordBinding
    ),
    GetPage(
      name: AppRoutes.editProfile,
      page: () => const EditProfileScreen(),
      binding: EditProfileBinding(), // <-- يستخدم ForgetPasswordBinding
    ),
    GetPage(
      name: AppRoutes.healthInformation,
      page: () => const HealthInformationScreen(),
      binding: HealthInformationBinding(), // <-- يستخدم ForgetPasswordBinding
    ),
    GetPage(
      name: AppRoutes.scanBarcode,
      page: () => const ScanBarcodeScreen(),
      binding: ScanBarcodeBinding(), // <-- يستخدم ForgetPasswordBinding
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(), // <-- يستخدم ForgetPasswordBinding
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsScreen(),
      binding: SettingsBinding(), // <-- يستخدم ForgetPasswordBinding
    ),
    GetPage(
      name: AppRoutes.helpAndSupport,
      page: () => const HelpAndSupportScreen(),
      binding: HelpSupportBinding(), // <-- يستخدم ForgetPasswordBinding
    ),
    GetPage(
      name: AppRoutes.contactUs,
      page: () => const ContactUsScreen(),
      binding: ContactUsBinding(), // <-- يستخدم ForgetPasswordBinding
    ),
    GetPage(
      name: AppRoutes.privacyPolicy,
      page: () => const PrivacyPolicyScreen(),
      binding: PrivacyPolicyBinding(), // <-- يستخدم ForgetPasswordBinding
    ),

  ];
}
