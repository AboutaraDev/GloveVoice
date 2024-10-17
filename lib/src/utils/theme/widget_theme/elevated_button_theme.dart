import 'package:flutter/material.dart';
import 'package:glovevoice/src/constants/colors.dart';
import 'package:glovevoice/src/constants/sizes.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(),
      foregroundColor: tWhiteColor,
      backgroundColor: tPrimaryColor2,
      side: BorderSide(color: tPrimaryColor2),
      padding: EdgeInsets.symmetric(vertical: tButtonWeight),
    ), 
  );


  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(),
      foregroundColor: tWhiteColor,
      backgroundColor: tPrimaryColor,
      side: BorderSide(color: tPrimaryColor),
      padding: EdgeInsets.symmetric(vertical: tButtonWeight),
    ), 
  );

}