import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/core/theme/app_colors.dart';
import 'package:pillwise_app/modules/scan_barcode/presentation/screens/scan_barcode_screen.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';
import '/modules/add_medication/presentation/screens/add_medication_screen.dart';
import '/modules/home/presentation/screens/home_screen.dart';
import '/modules/settings/presentation/screens/settings_screen.dart';

class NavbarController extends GetxController {
  late final List<Widget> screens;
  late final List<BarItem> items;
  RxInt selectedIndex = 1.obs;

  // دالة لتغيير الصفحة عند الضغط على أيقونة في الـ NavBar
  void changePage(int index) {
    selectedIndex.value = index;
  }

  _initNavbar() {
    screens = const [
      HomeScreen(),
      ScanBarcodeScreen(),
      SettingsScreen(),
    ];
    items = [
      BarItem(
        outlinedIcon: Icons.home_outlined,
        filledIcon: Icons.home,
      ),
      BarItem(
        outlinedIcon: Icons.add_circle_outline,
        filledIcon: Icons.add_circle,
      ),
      BarItem(
        outlinedIcon: Icons.person_pin_outlined,
        filledIcon: Icons.person_pin_sharp,
      ),
    ];
  }

  @override
  void onInit() {
    _initNavbar();
    super.onInit();
  }
}
