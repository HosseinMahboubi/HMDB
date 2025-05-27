import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  /// --- Provides an easy way to access this controller from anywhere in the app ---
  static LanguageController get instance => Get.find();

  /// --- The .obs makes it reactive, so the UI updates when it change ---
  final RxString _currentLanguage = 'en'.obs;

  ///--- Map to store language display names ---
  final Map<String, String> _languageNames = {
    'en': 'English',
    'fa': 'فارسی',
  };

  /// -- GET THE CURRENT LANGUAGE CODE --
  String get currentLanguage => _currentLanguage.value;

  /// -- GET THE DISPLAY NAME OF THE CURRENT LANGUAGE --
  String get currentLanguageDisplayName =>
      _languageNames[_currentLanguage.value] ?? 'English';

  /// --- When the app starts, it tries to load the previously saved language ---
  @override
  void onInit() {
    super.onInit();
    _loadSavedLanguage();
  }

  /// -- CHECK IF THE THE USER PREVIOUSLY SELECTED A LANGUAGE (IF THEY DID,LOADS IT) --
  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString('language');
    if (savedLanguage != null) {
      _currentLanguage.value = savedLanguage;
      updateLocale(savedLanguage);
    }
  }

  /// -- CHANGE THE APP'S LANGUAGE AND SAVE THE CHOICE FOR THE NEXT TIME --
  Future<void> changeLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);
    _currentLanguage.value = languageCode;
    updateLocale(languageCode);
  }

  /// -- TELLS THE APP TO USE THE NEW LANGUAGE --
  void updateLocale(String languageCode) {
    Get.updateLocale(Locale(languageCode));
  }

  /// -- CHECK IF THE CURRENT LANGUAGE IS RTL --
  bool isRTL() {
    return _currentLanguage.value == 'fa';
  }

  /// -- RETURN THE CURRENT LANGUAGE AS A LOCAL OBJECT --
  /// --- Flutter use this to know which language to display ---
  Locale getLocale() {
    return Locale(_currentLanguage.value);
  }
}
