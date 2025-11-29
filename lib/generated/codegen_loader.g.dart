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
  "validation": {
    "emptyField": "هذا الحقل مطلوب",
    "name_empty": "الرجاء إدخال اسمك",
    "name_short": "الاسم قصير جداً",
    "username_empty": "الرجاء إدخال اسم المستخدم",
    "username_short": "اسم المستخدم يجب أن يكون 4 أحرف على الأقل",
    "username_invalid": "اسم المستخدم يحتوي على رموز غير صالحة (استخدم أحرف، أرقام، و _ فقط)",
    "email_empty": "الرجاء إدخال البريد الإلكتروني",
    "email_invalid": "صيغة البريد الإلكتروني غير صحيحة",
    "phone_empty": "الرجاء إدخال رقم الهاتف",
    "phone_invalid": "صيغة الرقم غير صحيحة (مثال: 0512345678)",
    "password_empty": "الرجاء إدخال كلمة المرور",
    "password_short": "كلمة المرور يجب أن تكون 8 أحرف على الأقل",
    "password_complex": "كلمة المرور يجب أن تحتوي على حرف واحد ورقم واحد على الأقل",
    "confirmPassword_empty": "الرجاء تأكيد كلمة المرور",
    "confirmPassword_noMatch": "كلمتا المرور غير متطابقتين",
    "emailOrUsername_empty": "الرجاء إدخال البريد الإلكتروني أو اسم المستخدم",
    "emailOrUsername_invalid": "الصيغة المدخلة غير صالحة"
  },
  "countries": {
    "EG": "مصر",
    "SA": "المملكة العربية السعودية",
    "AE": "الإمارات العربية المتحدة",
    "QA": "قطر",
    "KW": "الكويت",
    "BH": "البحرين",
    "OM": "عُمان",
    "JO": "الأردن",
    "LB": "لبنان",
    "SY": "سوريا",
    "IQ": "العراق",
    "PS": "فلسطين",
    "YE": "اليمن",
    "LY": "ليبيا",
    "TN": "تونس",
    "DZ": "الجزائر",
    "MA": "المغرب",
    "MR": "موريتانيا",
    "SD": "السودان",
    "SO": "الصومال",
    "DJ": "جيبوتي",
    "KM": "جزر القمر"
  },
  "image_picker": {
    "choose_image": "اختر صورة",
    "gallery": "المعرض",
    "camera": "الكاميرا",
    "delete": "حذف الصورة"
  },
  "core": {
    "yes": "نعم",
    "no": "لا",
    "get_started": "ابدأ الآن",
    "skip": "تخطي",
    "next": "التالي",
    "or": "أو",
    "send": "إرسال",
    "reset": "إعادة تعيين",
    "save": "حفظ",
    "save_changes": "حفظ التغييرات",
    "cancel": "إلغاء",
    "arabic": "العربية",
    "english": "الانكليزية"
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
  },
  "forgetPassword": {
    "email": "البريد الالكتروني",
    "welcome": "لا مشكلة, هذا يحدث للجميع🙌",
    "description": "أدخل بريدك الالكتروني لإعادة تعيين كلمة مرورك"
  },
  "navbar": {
    "home": "الرئيسية",
    "me": "أنا"
  },
  "settings": {
    "settings_title": "الإعدادات",
    "settings_editProfile": "تعديل معلومات الملف الشخصي",
    "settings_healthInfo": "المعلومات الصحية",
    "settings_notifications": "الإشعارات",
    "settings_theme": "الثيم (المظهر)",
    "settings_language": "اللغة",
    "settings_help": "المساعدة والدعم",
    "settings_contact": "تواصل معنا",
    "settings_privacy": "سياسة الخصوصية",
    "settings_logout": "تسجيل الخروج",
    "settings_lightMode": "الفاتح",
    "settings_darkMode": "الداكن",
    "common_on": "يعمل",
    "common_off": "متوقف"
  },
  "profile": {
    "title_screen": "تعديل الملف الشخصي",
    "full_name": "الاسم كاملاً",
    "nick_name": "اسم المستخدم",
    "email": "البريد الالكتروني",
    "phone_number": "رقم الهاتف",
    "country": "المنطقة",
    "delete_account": "حذف الحساب"
  },
  "health_info": {
    "title_screen": "المعلومات الصحية",
    "gender": "الجنس",
    "male_g": "ذكر",
    "female_g": "أنثى",
    "date_of_birth": "تاريخ الميلاد",
    "weight": "الوزن (كجم)",
    "height": "الطول (سم)",
    "current_medications": "الأدوية الحالية",
    "pregnant": "حامل (إذا ينطبق)",
    "breastfeeding": "مرضعة (إذا ينطبق)"
  },
  "home": {
    "welcome_text": "مرحباً بعودتك",
    "description_text": "إليك نظرة عامة على أدويتك الحالية.",
    "medical_profile_is_incomplete": "ملفك الطبي غير مكتمل.",
    "medical_profile_is_incomplete_desc": "يرجى إضافة معلوماتك الشخصية والصحية [إكمال الملف]",
    "no_drugs_found": "لا توجد أدوية مضافة بعد.",
    "no_drugs_found_desc": "يرجى إضافة أدويتك."
  },
  "help_support_title": "المساعدة والدعم",
  "how_to_add_medication_q": "كيف أُضيف دواء؟",
  "how_to_add_medication_a": "اضغط على زر '+' في الشاشة الرئيسية. يمكنك: <ul><li>مسح الرمز الشريطي (الباركود) للدواء باستخدام الكاميرا، أو</li><li>البحث عن اسم الدواء باستخدام قاعدة البيانات المدمجة.</li></ul>",
  "how_scan_works_q": "كيف تعمل خاصية المسح (Scan)؟",
  "how_scan_works_a": "اضغط على '+' → 'مسح' ووجه الكاميرا نحو الرمز الشريطي للدواء. إذا كان الدواء موجوداً في قاعدة بياناتنا، سيتم تحميل معلوماته تلقائياً.",
  "medication_not_scan_q": "ماذا لو لم يتمكن التطبيق من مسح الدواء؟",
  "medication_not_scan_a": "استخدم خيار البحث واكتب اسم الدواء.",
  "medication_not_found_q": "ماذا لو لم يظهر الدواء في البحث؟",
  "medication_not_found_a": "إذا لم يتم العثور على الدواء في قاعدة البيانات، فلا يمكن إضافته في الوقت الحالي. نقوم بتحديث قاعدة البيانات بانتظام، وقد يصبح متاحاً لاحقاً.",
  "camera_wont_open_q": "لماذا لا تفتح الكاميرا؟",
  "camera_wont_open_a": "تحقق من إعدادات جهازك وتأكد من تمكين وصول تطبيق 'Pillwise' إلى الكاميرا.",
  "how_to_delete_medication_q": "كيف أحذف دواء؟",
  "how_to_delete_medication_a": "افتح الدواء الذي تريد إزالته واضغط على 'حذف'.",
  "app_not_saving_q": "التطبيق لا يحفظ أو لا يظهر التغييرات. ماذا أفعل؟",
  "app_not_saving_a": "أغلق التطبيق وأعد فتحه. إذا استمرت المشكلة، قم بالتحديث إلى أحدث إصدار.",
  "contact_us_title": "اتصل بنا",
  "contact_support_text": "إذا كنت بحاجة إلى دعم أو تريد الإبلاغ عن مشكلة تقنية، يمكنك التواصل معنا عبر:",
  "contact_phone_label": "الهاتف",
  "contact_working_hours_label": "ساعات العمل",
  "contact_working_hours": "9 صباحًا – 6 مساءً (الأحد - الخميس)",
  "contact_disclaimer": "للأسئلة الطبية أو حالات الطوارئ، يرجى الاتصال بأخصائي رعاية صحية.",
  "privacy_policy_title": "سياسة الخصوصية",
  "info_collect_title": "المعلومات التي نجمعها",
  "info_collect_data": "<ul><li>بيانات الأدوية المضافة عبر المسح أو البحث.</li><li>الصور الاختيارية التي يرفعها المستخدم.</li><li>معلومات الجهاز الأساسية لتحسين الأداء.</li></ul>",
  "how_we_use_data_title": "كيف نستخدم بياناتك",
  "how_we_use_data": "<ul><li>لتخزين وإدارة قائمة الأدوية الخاصة بك.</li><li>لتمكين ميزات المسح والبحث.</li><li>لتحسين استقرار التطبيق وتجربة المستخدم.</li></ul>",
  "data_protection_title": "حماية البيانات",
  "data_protection_measures": "<ul><li>جميع البيانات المخزنة مشفرة.</li><li>نحن لا نبيع أو نشارك بياناتك مع أطراف ثالثة.</li><li>يقتصر الوصول إلى بيانات النظام على الموظفين المصرح لهم فقط.</li></ul>",
  "your_rights_title": "حقوقك",
  "your_rights_data": "<ul><li>يمكنك حذف بياناتك في أي وقت.</li><li>يمكنك طلب نسخة من بياناتك المخزنة.</li><li>يمكنك إزالة الأدوية في أي وقت من داخل التطبيق.</li></ul>",
  "analytics_title": "التحليلات",
  "analytics_text": "نحن نستخدم تحليلات مجهولة المصدر فقط لتحسين الأداء وإصلاح المشكلات. لا يتم مشاركة أو بيع أي معلومات شخصية.",
  "privacy_contact_label": "جهة الاتصال للخصوصية"
};
static const Map<String,dynamic> _en = {
  "validation": {
    "emptyField": "This field is required",
    "name_empty": "Please enter your name",
    "name_short": "Name is too short",
    "username_empty": "Please enter a username",
    "username_short": "Username must be at least 4 characters",
    "username_invalid": "Username contains invalid characters (use letters, numbers, and _ only)",
    "email_empty": "Please enter your email",
    "email_invalid": "Email format is incorrect",
    "phone_empty": "Please enter your phone number",
    "phone_invalid": "Phone format is incorrect (e.g., 0512345678)",
    "password_empty": "Please enter a password",
    "password_short": "Password must be at least 8 characters",
    "password_complex": "Password must contain at least one letter and one number",
    "confirmPassword_empty": "Please confirm your password",
    "confirmPassword_noMatch": "Passwords do not match",
    "emailOrUsername_empty": "Please enter your email or username",
    "emailOrUsername_invalid": "The input format is invalid"
  },
  "countries": {
    "EG": "Egypt",
    "SA": "Saudi Arabia",
    "AE": "United Arab Emirates",
    "QA": "Qatar",
    "KW": "Kuwait",
    "BH": "Bahrain",
    "OM": "Oman",
    "JO": "Jordan",
    "LB": "Lebanon",
    "SY": "Syria",
    "IQ": "Iraq",
    "PS": "Palestine",
    "YE": "Yemen",
    "LY": "Libya",
    "TN": "Tunisia",
    "DZ": "Algeria",
    "MA": "Morocco",
    "MR": "Mauritania",
    "SD": "Sudan",
    "SO": "Somalia",
    "DJ": "Djibouti",
    "KM": "Comoros"
  },
  "image_picker": {
    "choose_image": "Choose Image",
    "gallery": "Gallery",
    "camera": "Camera",
    "delete": "Delete Image"
  },
  "core": {
    "yes": "Yes",
    "no": "No",
    "get_started": "Get Started",
    "skip": "Skip",
    "next": "Next",
    "or": "OR",
    "send": "Send",
    "reset": "Reset",
    "save": "Save",
    "save_changes": "Save Changes",
    "cancel": "Cancel",
    "arabic": "Arabic",
    "english": "English"
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
  },
  "forgetPassword": {
    "email": "Email",
    "welcome": "No problem, this happens to everyone🙌",
    "description": "Enter your email below to reset your password"
  },
  "navbar": {
    "home": "Home",
    "me": "Me"
  },
  "settings": {
    "settings_title": "Settings",
    "settings_editProfile": "Edit profile information",
    "settings_healthInfo": "Health Information",
    "settings_notifications": "Notifications",
    "settings_theme": "Theme",
    "settings_language": "Language",
    "settings_help": "Help & Support",
    "settings_contact": "Contact us",
    "settings_privacy": "Privacy policy",
    "settings_logout": "Logout",
    "settings_lightMode": "Light",
    "settings_darkMode": "Dark",
    "common_on": "ON",
    "common_off": "OFF"
  },
  "profile": {
    "title_screen": "Edit Profile",
    "full_name": "Full Name",
    "nick_name": "Nick Name",
    "email": "Email",
    "phone_number": "Phone Number",
    "country": "Country",
    "delete_account": "Delete Account"
  },
  "health_info": {
    "title_screen": "Health Information",
    "gender": "Gender",
    "male_g": "Male",
    "female_g": "Female",
    "date_of_birth": "Date Of Birth",
    "weight": "Weight (kg)",
    "height": "Height (cm)",
    "current_medications": "Current Medications",
    "pregnant": "Pregnant (if applicable)",
    "breastfeeding": "Breastfeeding (if applicable)"
  },
  "home": {
    "welcome_text": "Welcome back",
    "description_text": "Here’s your current medication overview.",
    "medical_profile_is_incomplete": "Your medical profile is incomplete.",
    "medical_profile_is_incomplete_desc": "Please add your personal and health information [Cpmplete Profile]",
    "no_drugs_found": "No medications added yet.",
    "no_drugs_found_desc": "Please add your medications."
  },
  "help_support_title": "Help & Support",
  "how_to_add_medication_q": "How do I add a medication?",
  "how_to_add_medication_a": "Tap the “+” button on the main screen. You can: <ul><li>Scan the medication barcode using your camera, or</li><li>Search for the medication name using the built-in database.</li></ul>",
  "how_scan_works_q": "How does the Scan feature work?",
  "how_scan_works_a": "Tap “+” → “Scan” and point your camera at the medication barcode. If the medication exists in our database, its information will load automatically.",
  "medication_not_scan_q": "What if the medication doesn’t scan?",
  "medication_not_scan_a": "Use the Search option and type the medication name.",
  "medication_not_found_q": "What if the medication doesn’t appear in search?",
  "medication_not_found_a": "If the medication is not found in the database, it cannot be added at the moment. We update the database regularly, so it may become available later.",
  "camera_wont_open_q": "Why won’t the camera open?",
  "camera_wont_open_a": "Check your device settings and make sure Pillwise has camera access enabled.",
  "how_to_delete_medication_q": "How do I delete a medication?",
  "how_to_delete_medication_a": "Open the medication you want to remove and tap “Delete”.",
  "app_not_saving_q": "The app isn’t saving or showing changes. What should I do?",
  "app_not_saving_a": "Close the app and reopen it. If the issue continues, update to the latest version.",
  "contact_us_title": "Contact Us",
  "contact_support_text": "If you need support or want to report a technical issue, you can reach us at:",
  "contact_phone_label": "Phone",
  "contact_working_hours_label": "Working Hours",
  "contact_working_hours": "9 AM – 6 PM (Sun–Thu)",
  "contact_disclaimer": "For medical questions or emergencies, please contact a healthcare professional.",
  "privacy_policy_title": "Privacy Policy",
  "info_collect_title": "Information We Collect",
  "info_collect_data": "<ul><li>Medication data added through scanning or searching.</li><li>Optional images uploaded by the user.</li><li>Basic device information for improving performance.</li></ul>",
  "how_we_use_data_title": "How We Use Your Data",
  "how_we_use_data": "<ul><li>To store and manage your medication list.</li><li>To enable scanning and searching features.</li><li>To enhance app stability and user experience.</li></ul>",
  "data_protection_title": "Data Protection",
  "data_protection_measures": "<ul><li>All stored data is encrypted.</li><li>We do not sell or share your data with third parties.</li><li>Access to system data is restricted to authorized personnel only.</li></ul>",
  "your_rights_title": "Your Rights",
  "your_rights_data": "<ul><li>You can delete your data at any time.</li><li>You can request a copy of your stored data.</li><li>You can remove medications anytime within the app.</li></ul>",
  "analytics_title": "Analytics",
  "analytics_text": "We use anonymous analytics solely to improve performance and fix issues. No personal information is shared or sold.",
  "privacy_contact_label": "Privacy Contact"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
