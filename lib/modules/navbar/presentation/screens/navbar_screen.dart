import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/core/theme/app_colors.dart';
import 'package:pillwise_app/modules/navbar/presentation/widgets/bottom_navbar_item_widget.dart';
import '../controllers/navbar_controller.dart';

class NavbarScreen extends GetView<NavbarController> {
  const NavbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: controller.screens,
        ),
      ),

      bottomNavigationBar: Obx(
        () => SizedBox(
          height: 56.h,
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            iconSize: 24.sp,
            type: BottomNavigationBarType.shifting,
            useLegacyColorScheme: false,
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changePage,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.add_circle),label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
