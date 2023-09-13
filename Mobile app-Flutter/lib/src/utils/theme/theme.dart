import 'package:ecg_auth_app_heartizm/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:ecg_auth_app_heartizm/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:ecg_auth_app_heartizm/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:ecg_auth_app_heartizm/src/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

class HAppTheme {
  HAppTheme._(); // private constructor

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: HTextTheme.lightTextTheme,
    outlinedButtonTheme: HOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: HElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: HTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: HTextTheme.darkTextTheme,
    outlinedButtonTheme: HOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: HElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: HTextFormFieldTheme.darkInputDecorationTheme,
  );
}
