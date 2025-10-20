/// كلاس مركزي لتعريف كل مسارات الـ assets
/// هذا يمنع الأخطاء الإملائية ويجعل الصيانة سهلة
abstract class AppAssets {

  // --- المسارات الأساسية ---
  static const String _imagesPath = 'assets/images';
  static const String _iconsPath = 'assets/icons';
  static const String _lottiePath = 'assets/lottie';

  // --- الصور (PNG / JPG) ---
  static const String logo = '$_imagesPath/logo.png';
  static const String background = '$_imagesPath/background.jpg';

  // --- الأيقونات (SVG) ---
  static const String homeIcon = '$_iconsPath/home_icon.svg';
  static const String profileIcon = '$_iconsPath/profile_icon.svg';

  // --- ملفات Lottie (JSON) ---
  static const String  scanDrugAnimation = '$_lottiePath/scan_drug_lottie.json';
  static const String  healthAnalysisAnimation = '$_lottiePath/health_analysis_lottie.json';
  static const String  calendarAnimation = '$_lottiePath/calendar_lottie.json';



}