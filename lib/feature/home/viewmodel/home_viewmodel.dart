import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sozEBay/feature/alarm/view/alarm_view.dart';
import 'package:sozEBay/feature/dictionary/view/dictionary_view.dart';
import 'package:sozEBay/feature/images/view/images_view.dart';
import 'package:sozEBay/feature/settings/view/settings_view.dart';

import '../../../product/constants/enums/string/string_constants.dart';
import '../../../product/init/language/locale_keys.g.dart';

class HomeViewModel {
  final Box themeChangeBox = Hive.box(SozEBayStringConstants.settings);

  List<List> viewButtons = [
    [
      LocaleKeys.home_dictionary.tr(),
      const DictionaryView(),
      Icons.receipt_long_rounded,
      Colors.white,
    ],
    [
      LocaleKeys.home_images.tr(),
      const ImagesView(),
      Icons.image_outlined,
      Colors.white,
    ],
    [
      LocaleKeys.home_alarm.tr(),
      const AlarmView(),
      Icons.alarm,
      Colors.white,
    ],
    [
      LocaleKeys.home_settings.tr(),
      const SettingsView(),
      Icons.settings_outlined,
      Colors.white,
    ]
  ];
}
