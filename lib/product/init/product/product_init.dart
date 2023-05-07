import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sozEbay/feature/alarm/viewmodel/alarm_init.dart';

import '../../../core/init/theme/notifier/theme_notifier.dart';
import '../../../feature/alarm/viewmodel/alarm_model.dart';
import '../language/localization_init.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

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
    await LocalAlarmSettings().initialize(flutterLocalNotificationsPlugin);
  }
}
