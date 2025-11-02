import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/modules/navbar/presentation/controllers/navbar_controller.dart';

class BottomNavbarItemWidget extends GetView<NavbarController> {
  const BottomNavbarItemWidget(
      {super.key,
      required this.icon,
      required this.selectedIcon,
      required this.index});

  final IconData icon;
  final IconData selectedIcon;
  final int index;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = controller.selectedIndex.value == index;
    return IconButton(
      icon: Icon(
        isSelected ? selectedIcon : icon, // عرض الأيقونة المناسبة
        color: isSelected ? Get.theme.primaryColor :null // اللون المناسب
      ),
      onPressed: () => controller.changePage(index), // تغيير الصفحة عند الضغط
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}
