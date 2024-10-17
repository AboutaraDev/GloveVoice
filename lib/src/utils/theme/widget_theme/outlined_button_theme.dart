import 'package:flutter/material.dart';
import 'package:glovevoice/src/constants/colors.dart';
import 'package:glovevoice/src/constants/sizes.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: tPrimaryColor,
      side: BorderSide(color: tPrimaryColor),
      padding: EdgeInsets.symmetric(vertical: tButtonWeight),
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: tPrimaryColor2,
      side: BorderSide(color: tPrimaryColor2),
      padding: EdgeInsets.symmetric(vertical: tButtonWeight),
    ),
  );
}