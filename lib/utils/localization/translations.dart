import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class AppTranslations extends Translations {
  /// -- STORES TRANSLATION FOR DIFFERENT LANGUAGES --
  final Map<String, Map<String, String>> translationsMap;

  AppTranslations(this.translationsMap);

  /// -- WHERE TO FIND ALL THE TRANSLATIONS --
  @override
  Map<String, Map<String, String>> get keys => translationsMap;

  /// -- LOADS ALL THE LANGUAGES FILE WHEN THE APP STARTS --
  static Future<AppTranslations> load() async {
    /// --- Create a map to store translations ---
    Map<String, Map<String, String>> translations = {};

    try {
      /// --- Load English translations ---
      translations['en'] = await _loadJson('assets/language/en.json');

      /// --- Load Persian translations ---
      translations['fa'] = await _loadJson('assets/language/fa.json');
    } catch (e) {
      /// --- Silent error handling ---
    }

    return AppTranslations(translations);
  }

  /// -- READS AND CONVERTS THE JSON LANGUAGE FILES INTO A FORMAT GET X CAN USE --
  static Future<Map<String, String>> _loadJson(String path) async {
    try {
      final jsonString = await rootBundle.loadString(path);
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      return jsonMap.map((key, value) => MapEntry(key, value.toString()));
    } catch (e) {
      return {};
    }
  }
}
