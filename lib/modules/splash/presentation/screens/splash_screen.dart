import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pillwise_app/app/core/widgets/app_svg_widget.dart';
import 'package:pillwise_app/app/routes/app_routes.dart';
import '../controllers/splash_controller.dart';
import 'package:animate_do/animate_do.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: 0,
            top: -30,
            child: Transform.rotate(
              angle: .2,
              child: Image.asset(
                'assets/images/welcome_bottle_drug.png',
                width: 300,
                height: 300,
              ).fadeInDownBig(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'welcome to pillwisee',
                  textAlign: TextAlign.center,
                  style: Get.theme.textTheme.displayLarge?.copyWith(
                    color: Get.theme.primaryColor,
                  ),
                ).fadeIn(),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'track, Scan, and find the right dosage for you',
                  textAlign: TextAlign.center,
                  style: Get.theme.textTheme.bodyMedium?.copyWith(
                    color: Get.theme.primaryColor,
                  ),
                ).fadeInLeft(),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.onboarding);
                        }, child: Text('Go To Intro Page'))
                    .zoomIn()
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: AppSvgWidget(
              assetsUrl: 'assets/icons/welcome_wave.svg',
              color: Get.theme.primaryColor,
              width: double.maxFinite,
              height: 260,
            ).fadeInUp(),
          ),
        ],
      ),
    );
  }
}
