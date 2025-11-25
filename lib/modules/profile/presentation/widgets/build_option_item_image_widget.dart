import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildOptionItemImageWidget extends StatelessWidget {
  const BuildOptionItemImageWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap,
      this.color});

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: color ?? Get.theme.primaryColor),
      title: Text(
        title,
        style: Get.textTheme.bodyMedium,
      ),
      onTap: onTap,
    );
  }
}
