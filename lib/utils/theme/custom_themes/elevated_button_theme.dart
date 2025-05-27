import 'package:flutter/material.dart';
import 'package:hmdb/utils/constants/colors.dart';

class HMElevatedButtonTheme {
  HMElevatedButtonTheme._(); // To avoid creating Instances

  // -- Light Theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 1, // Slight elevation for better visibility
      foregroundColor: Colors.white,
      backgroundColor: HMColors.buttonSecondary,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey.withOpacity(0.5),
      side: const BorderSide(color: HMColors.buttonSecondary),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  // -- Dark Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: HMColors.buttonSecondary,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: HMColors.buttonSecondary),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
