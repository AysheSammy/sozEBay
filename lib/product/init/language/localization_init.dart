import 'package:flutter/material.dart';

class LocalizationInit {
  final List<Locale> supportedLocales = [const Locale('en', 'EN'), const Locale('ru', 'RU')];
  final Locale defaultLocale = const Locale('en', 'EN');
  final Locale fallbackLocale = const Locale('ru', 'RU');
  final String path = 'assets/translations';
  final bool useFallbackTranslations = true;
}
