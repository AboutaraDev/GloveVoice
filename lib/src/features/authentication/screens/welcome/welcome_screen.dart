import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:glovevoice/src/constants/colors.dart';
import 'package:glovevoice/src/constants/image_strings.dart';


import 'package:glovevoice/src/constants/sizes.dart';
import 'package:glovevoice/src/constants/text_strings.dart';
import 'package:glovevoice/src/features/authentication/screens/login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: AssetImage(tWelcomeScreenImage), height: height * 0.6,),
            Column(
              children: [
                Text(tWelcomeTitle, 
                style: Theme.of(context).textTheme.headlineLarge),
                
                Text(tWelcomeSubTitle, 
                style: Theme.of(context).textTheme.labelMedium, 
                textAlign: TextAlign.center,
                ),

              ],
            ),
            
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.to(() => const LoginScreen()),
                    child: Text(tLogin.toUpperCase()))),
                const SizedBox(width: 10.0,),

                Expanded(
                  child: ElevatedButton(
                    onPressed: (){},
                    
                    child: Text(tSignUp.toUpperCase()))),
              ],
            ),
          ],
        ),
        ),
    );
  }


}