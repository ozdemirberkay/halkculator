import 'package:flutter/material.dart';

class AppLocale {
  static Locale fallbackLocale = LocaleNames.turkishLocale;

  static List<Locale> supportedLocales = [LocaleNames.turkishLocale];
}

class LocaleNames {
  static Locale turkishLocale = const Locale('tr', 'TR');
  static Locale englishLocale = const Locale('en', 'US');
}
