import 'package:flutter/material.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/theme/custom_themes/appbar_theme.dart';
import 'package:hmdb/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:hmdb/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:hmdb/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:hmdb/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:hmdb/utils/theme/custom_themes/text_field_theme.dart';
import 'package:hmdb/utils/theme/custom_themes/text_theme.dart';

class HMAppTheme {
  /// --- This action will make this class Privet ---
  HMAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: HMColors.primary,
    textTheme: HMTextTheme.lightTextTheme,
    appBarTheme: HMAppBarTheme.lightAppBarTheme,
    checkboxTheme: HMCheckBoxTheme.lightCheckBoxTheme,
    bottomSheetTheme: HMBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: HMElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: HMOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: HMTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primaryColor: HMColors.primary,
    textTheme: HMTextTheme.darkTextTheme,
    appBarTheme: HMAppBarTheme.darkAppBarTheme,
    checkboxTheme: HMCheckBoxTheme.darkCheckBoxTheme,
    bottomSheetTheme: HMBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: HMElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: HMOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: HMTextFormFieldTheme.darkInputDecorationTheme,
  );
}
