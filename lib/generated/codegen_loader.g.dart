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
    "yes": "نعم",
    "no": "لا",
    "get_started": "ابدأ الآن",
    "skip": "تخطي",
    "next": "التالي",
    "or": "أو"
  },
  "splash": {
    "description": "رفيقك الأول لتنظيم مواعيد الدواء والعناية بصحتك.",
    "copyright": "© هيئة الغذاء والدواء السعودية"
  },
  "welcome": {
    "welcome_text_app": "أهلاً بك في PillWise",
    "welcome_description": "تتبع، امسح، واعثر على الجرعة المناسبة لك"
  },
  "onboarding": {
    "title1": "تذكيرات ذكية بالدواء",
    "sub_title1": "لا تفوّت أي جرعة بعد اليوم. احصل على تنبيهات دقيقة ومباشرة لمواعيد دوائك وابق على اطلاع بجدولك الصحي.",
    "title2": "مسح سهل للوصفات الطبية",
    "sub_title2": "انضم إلى الدراسات أو سجل حضورك الصحي بسهولة. فقط امسح رمز الاستجابة السريعة (QR) وستكون جاهزًا في ثوانٍ.",
    "title3": "رؤى صحية مخصصة",
    "sub_title3": "افهم صحتك بشكل أعمق. احصل على نصائح وإحصائيات مخصصة بناءً على بياناتك وتقدمك اليومي."
  },
  "login": {
    "welcome_back": "أهلاً بعودتك! 👋",
    "description": "سجّل دخولك لمتابعة مواعيدك.",
    "email_or_user_name": "اسم المستخدم أو البريد الإلكتروني",
    "password": "كلمة المرور",
    "forget_password": "هل نسيت كلمة المرور؟",
    "remember_me": "تذكرني",
    "login": "تسجيل الدخول",
    "continue_with_apple": "آبل",
    "continue_with_google": "جوجل",
    "do_not_have_account": "ليس لديك حساب؟ ",
    "signup": "إنشاء حساب"
  },
  "signup": {
    "welcome": "أهلاً بك! 💊",
    "description": "خطوتك الأولى نحو الالتزام",
    "name": "الاسم الثلاثي",
    "user_name": "اسم المستخدم",
    "email": "البريد الإلكتروني",
    "phone_number": "رقم الهاتف",
    "password": "كلمة المرور",
    "confirm_password": "تأكيد كلمة المرور",
    "signup": "إنشاء حساب",
    "continue_with_apple": "آبل",
    "continue_with_google": "جوجل",
    "hava_account": "لديك حساب بالفعل؟ ",
    "login": "تسجيل الدخول"
  }
};
static const Map<String,dynamic> _en = {
  "core": {
    "yes": "Yes",
    "no": "No",
    "get_started": "Get Started",
    "skip": "Skip",
    "next": "Next",
    "or": "OR"
  },
  "splash": {
    "description": "Your first companion for organizing medication schedules and taking care of your health.",
    "copyright": "Saudi Food and Drug Authority ©"
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
  },
  "login": {
    "welcome_back": "Hi, Welcome Back! 👋",
    "description": "Login to keep track of your appointments.",
    "email_or_user_name": "User name or Email",
    "password": "Password",
    "forget_password": "Forgot Password ?",
    "remember_me": "Remember Me",
    "login": "Login",
    "continue_with_apple": "Apple",
    "continue_with_google": "Google",
    "do_not_have_account": "Don’t have an account ? ",
    "signup": "Sign Up"
  },
  "signup": {
    "welcome": "Welcome! 💊",
    "description": "Your first step towards commitment",
    "name": "Name",
    "user_name": "User name",
    "email": "Email",
    "phone_number": "Phone number",
    "password": "Password",
    "confirm_password": "Confirm password",
    "signup": "Sign up",
    "continue_with_apple": "Apple",
    "continue_with_google": "Google",
    "hava_account": "Already have an account? ",
    "login": "Login"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
