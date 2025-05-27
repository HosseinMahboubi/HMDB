import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'package:hmdb/utils/localization/translations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  /// --- Load translations and ensure they're fully loaded ---
  final translations = await AppTranslations.load();

  /// --- Run the app with the loaded translations ---
  runApp(App(translations: translations));
}
