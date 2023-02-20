import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../core/init/theme/notifier/theme_notifier.dart';
import '../language/localization_init.dart';

class ProductInit {

  final localizationInit = LocalizationInit();

  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider<ThemeNotifier>(
      create: (context) => ThemeNotifier(),
    ),

  ];

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await AndroidAlarmManager.initialize();
  }
}
