import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationHelper {
  LocalizationHelper._();

  static const String translationPath = 'assets/translations';
  static const String localeStorageKey = 'selected_locale_code';

  static const Locale fallbackLocale = Locale('en');
  static const List<Locale> supportedLocales = [Locale('ar'), Locale('en')];
  static const String appName = 'GitrusGuard AI';

  static bool isArabic(Locale locale) => locale.languageCode == 'ar';

  static Future<Locale> loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final savedCode = prefs.getString(localeStorageKey);

    if (savedCode == 'ar') {
      return const Locale('ar');
    }

    if (savedCode == 'en') {
      return const Locale('en');
    }

    return fallbackLocale;
  }

  static Future<void> saveLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(localeStorageKey, locale.languageCode);
  }

  static Future<void> setLocale(BuildContext context, Locale locale) async {
    await saveLocale(locale);
    await context.setLocale(locale);
  }
}
