
import 'package:get/get.dart';
import 'package:pillwise_app/modules/add_medication/presentation/screens/add_medication_screen.dart';
import 'package:pillwise_app/modules/home/presentation/screens/home_screen.dart';
import 'package:pillwise_app/modules/profile/presentation/screens/profile_screen.dart';
import 'package:pillwise_app/modules/settings/presentation/screens/settings_screen.dart';

class NavbarController extends GetxController {
  late final screens;
  var selectedIndex = 1.obs;

  // دالة لتغيير الصفحة عند الضغط على أيقونة في الـ NavBar
  void changePage(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    screens  = [
      HomeScreen(),
      AddMedicationScreen(),
      SettingsScreen(),
    ];
    super.onInit();

  }
}