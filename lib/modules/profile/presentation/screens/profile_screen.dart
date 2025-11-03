import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/core/constants/app_assets.dart';
import 'package:pillwise_app/app/core/widgets/app_padding_widget.dart';
import 'package:pillwise_app/app/core/widgets/app_svg_widget.dart';
import 'package:pillwise_app/app/core/widgets/app_text_filed_widget.dart';
import '../controllers/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ProfileScreen'),
          centerTitle: true,
        ),

    );
  }
}
