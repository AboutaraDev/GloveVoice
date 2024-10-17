import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glovevoice/src/features/authentication/screens/welcome/welcome_screen.dart';

class SplashScreenController extends GetxController{
  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;

    Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
      animate.value = true;

    await Future.delayed(Duration(milliseconds: 4000));
    Get.to(WelcomeScreen());
    //Navigator.pushReplacement(
    //  context,
    //  MaterialPageRoute(builder: (context) => WelcomeScreen()),);
  }
}

