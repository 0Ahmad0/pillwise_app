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
  static const home = '/home';

  // --- ميزة البروفايل (Profile) ---
  static const profile = '/profile';
  static const editProfile = '/profile/edit';
  static const settings = '/settings';
}