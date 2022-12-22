import 'package:flutter/material.dart';

class LocalizationInit {
  final List<Locale> supportedLocales = [const Locale('tm', 'TM'), const Locale('ru', 'RU'), const Locale('en', 'EN')];
  final Locale defaultLocale = const Locale('tm', 'TM');
  final String path = 'assets/translations';
}
