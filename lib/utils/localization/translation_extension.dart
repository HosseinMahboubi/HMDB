import 'package:flutter/material.dart';
import 'package:hmdb/utils/localization/app_localizations.dart';

/// ============= Add A NEW METHOD CALLED "translate()" TO ALL THE STRINGS IN THE APP =============
extension TranslationExtension on String {
  String translate(BuildContext context) {
    return AppLocalizations.of(context).translate(this);
  }
}
