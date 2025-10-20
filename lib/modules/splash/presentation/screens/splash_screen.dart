import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            top: -6,
            child: Transform.rotate(
              angle: .1,
              child: Image.asset(
                'assets/welcome_bottle_drug.png',
                width: 300,
                height: 300,
              ).slideDown(),
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
                ElevatedButton(onPressed: () {}, child: Text('Go To Intro Page')).zoomIn()
              ],
            ),
          ),
          Positioned(
            left: -20,
            bottom: 0,
            child: Image.asset(
              'assets/img.png',
              width: 300,
              height: 300,
            ).slideUp(),
          ),

        ],
      ),
    );
  }
}
