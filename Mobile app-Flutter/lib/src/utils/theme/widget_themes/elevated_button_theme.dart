import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class HElevatedButtonTheme{
  HElevatedButtonTheme._();

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      foregroundColor: whiteColor,
      backgroundColor: secondaryColor ,
      side: const BorderSide(
        color: secondaryColor,

      ),
      padding: const EdgeInsets.symmetric(
        vertical: buttonHeight,
      ),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      foregroundColor: secondaryColor,
      backgroundColor: whiteColor ,
      side: const BorderSide(
        color: secondaryColor,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: buttonHeight,
      ),
    ),
  );
}