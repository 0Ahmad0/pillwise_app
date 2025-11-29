// نستخدم abstract class لضمان عدم إنشاء نسخة (instance) منها
abstract class AppRoutes {
  // لا نحتاج لإنشاء أي كائن من هذا الكلاس
  // AppRoutes._();

  // المسار الأولي (يمكن أن يكون Splash أو Login)
  static const initial = '/';

  static const welcome = '/welcome';
  static const onboarding = '/onboarding';

  // --- ميزة المصادقة (Auth) ---
  static const login = '/login';
  static const signup = '/signup';
  static const forgetPassword = '/forgot-password';

  // --- ميزة الرئيسية (Home) ---

  // --- ميزة البروفايل (Profile) ---
  static const editProfile = '/edit_profile';
  static const settings = '/settings';

  static const navbar = '/navbar';
  static const home = '/home';
  static const addMedication = '/add_medication';
  static const healthInformation = '/health_information';
  static const profile = '/profile';
  static const scanBarcode = '/scan_barcode';
  static const helpAndSupport = '/help_and_support';
  static const contactUs = '/contact_us';
  static const privacyPolicy = '/privacy_policy';

}
