import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sozEbay/feature/alarm/view/alarm_view.dart';
import 'package:sozEbay/feature/dictionary/view/dictionary_view.dart';
import 'package:sozEbay/feature/notification/view/notifications_view.dart';
import 'package:sozEbay/feature/settings/view/settings_view.dart';

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
      LocaleKeys.home_notifications.tr(),
      const NotificationsView(),
      Icons.notifications_active_outlined,
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
      Icons.build_outlined,
      Colors.white,
    ]
  ];
}
