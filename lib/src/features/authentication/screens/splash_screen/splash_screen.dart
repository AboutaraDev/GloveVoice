import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:glovevoice/src/constants/colors.dart';
import 'package:glovevoice/src/constants/image_strings.dart';
import 'package:glovevoice/src/constants/sizes.dart';
import 'package:glovevoice/src/constants/text_strings.dart';
import 'package:glovevoice/src/features/authentication/controllers/splash_screen_controller.dart';
import 'package:glovevoice/src/features/authentication/screens/welcome/welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key); // Fix casing of 'key'

  final splashController = Get.put(SplashScreenController());



  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
      body: Stack(
        children: [
          // Top icon animation
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: splashController.animate.value ? -60 : -90,
              left: splashController.animate.value ? -60 : -90,
              child: Image(
                image: AssetImage(tSplashTopIcon),
              ),
            ),
          ),

          // Text animation (App name and tagline)
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: 95,
              left: splashController.animate.value ? tDefaultSize : -95, // Modify left position
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1600),
                opacity: splashController.animate.value ? 1 : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tAppName,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      tAppTagLine,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Image animation (Main splash image)
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: splashController.animate.value ? 100 : 0,
              left: 0, // Add left alignment to center it better
              right: 0, // Add right alignment to center it better
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                opacity: splashController.animate.value ? 1 : 0,
                child: Image(
                  image: AssetImage(tSplashImage),
                  fit: BoxFit.contain, // Adjust image fitting to avoid it overflowing
                  width: 400,
                  height: 500,
                ),
              ),
            ),
          ),

          // Bottom circular animation
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: splashController.animate.value ? 40 : 0,
              right: tDefaultSize,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                opacity: splashController.animate.value ? 1 : 0,
                child: Container(
                  width: tSpalshContanerSize,
                  height: tSpalshContanerSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: tPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
