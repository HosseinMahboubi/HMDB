import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  /// --- Helper method to keep the code in the widgets and  makes it easy to get translations from anywhere in your app ---
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  /// --- Creates a special delegate that Flutter needs to handle translations ---
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// --- Will store all the translated words and phrases ---
  late Map<String, String> _localizedStrings;

  /*
- Loads the translation file based on which language is selected
- If English is selected, it loads "en.json"
- If Persian is selected, it loads "fa.json"
- Converts the JSON file into a format the app can use
- 👇
  */

  Future<bool> load() async {
    /// --- Load the language JSON file from the "language" folder ---
    String jsonString = await rootBundle
        .loadString('assets/language/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

/*
- The method  use to translate text
- If it can't find a translation, it returns the original text
- 👇
*/

  /// --- This method will be called from every widget which needs a localized text ---
  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }
}

/// --- A helper class that Flutter needs to manage translations ---
class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    /// --- Include all of your supported language codes here ---
    return ['en', 'fa'].contains(locale.languageCode);
  }

  /// --- Creates and loads the translations for the selected language ---
  @override
  Future<AppLocalizations> load(Locale locale) async {
    /// --- AppLocalizations class is where the JSON loading actually runs ---
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  /// --- Tells Flutter it doesn't need to reload translations unless the app restarts ---
  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
