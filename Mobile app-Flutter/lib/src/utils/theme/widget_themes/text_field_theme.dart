import 'package:ecg_auth_app_heartizm/src/constants/colors.dart';
import 'package:flutter/material.dart';

class HTextFormFieldTheme {
  HTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0)),
      prefixIconColor: secondaryColor,
      floatingLabelStyle: const TextStyle(color: secondaryColor),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.0),
        borderSide: const BorderSide(width: 2.0, color: secondaryColor),
      ));

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0)),
      prefixIconColor: primaryColor,
      floatingLabelStyle: const TextStyle(color: primaryColor),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.0),
        borderSide: const BorderSide(width: 2.0, color: primaryColor),
      ));
}
