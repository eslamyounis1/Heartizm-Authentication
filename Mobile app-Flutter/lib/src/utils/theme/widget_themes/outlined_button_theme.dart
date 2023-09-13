import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class HOutlinedButtonTheme{
  HOutlinedButtonTheme._();

  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      foregroundColor: secondaryColor,
      side: const BorderSide(
        color: secondaryColor,
      ),
      padding:  const EdgeInsets.symmetric(
        vertical: buttonHeight,
      ),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      foregroundColor: whiteColor,
      side: const BorderSide(
        color: whiteColor,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: buttonHeight,
      ),
    ),
  );
}