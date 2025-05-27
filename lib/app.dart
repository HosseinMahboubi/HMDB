import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hmdb/screens/splash/splash_screen.dart';
import 'package:hmdb/utils/localization/app_localizations.dart';
import 'package:hmdb/utils/localization/controller/language_controller.dart';
import 'package:hmdb/utils/localization/translations.dart';
import 'package:hmdb/utils/theme/theme.dart';

class App extends StatelessWidget {
  final AppTranslations translations;

  const App({super.key, required this.translations});

  @override
  Widget build(BuildContext context) {
    /// -- INITIALIZE THE LANGUAGE CONTROLLER --
    final languageController = Get.put(LanguageController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: HMAppTheme.lightTheme,
      darkTheme: HMAppTheme.darkTheme,

      /// -- ADD LOCALIZATION SUPPORT --
      translations: translations,
      locale: Locale(languageController.currentLanguage),
      fallbackLocale: const Locale('en'),
      supportedLocales: const [
        Locale('en'),
        Locale('fa'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      home: const SplashScreen(),
    );
  }
}
