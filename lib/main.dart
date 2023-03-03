import 'dart:isolate';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sozEBay/product/init/navigator/app_router.dart';
import 'package:sozEBay/product/init/product/product_init.dart';
import 'core/constants/app/app_constants.dart';
import 'package:flutter/material.dart';

import 'core/init/theme/dark/app_theme_dark.dart';
import 'core/init/theme/light/app_theme_light.dart';
import 'feature/splash/viewmodel/splash_viewmodel.dart';
import 'product/constants/enums/string/string_constants.dart';
import 'product/init/build/main_build.dart';

@pragma('vm:entry-point')
void printHello() {
  final DateTime now = DateTime.now();
  final int isolateId = Isolate.current.hashCode;
  debugPrint("[$now] Hello, world! isolate=$isolateId function='$printHello'");
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();

  await SplashViewModel().hiveInit();
  final productInit = ProductInit();
  await productInit.init();
  runApp(
    EasyLocalization(
      supportedLocales: productInit.localizationInit.supportedLocales,
      path: productInit.localizationInit.path,
      fallbackLocale: productInit.localizationInit.defaultLocale,
      startLocale: productInit.localizationInit.defaultLocale,
      child: MultiProvider(
        providers: productInit.providers,
        builder: (context, child) => const MyApp(),
      ),
    ),
  );
  const int helloAlarmID = 0;
  await AndroidAlarmManager.periodic(
      const Duration(minutes: 1), helloAlarmID, printHello);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: Hive.box(SozEBayStringConstants.settings).listenable(),
      builder: (context, box, child) {
        return MaterialApp.router(
          builder: MainBuild.build,
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          theme: box.get(SozEBayStringConstants.settingsDarkMode,
                  defaultValue: false)
              ? AppThemeDark.instance.theme
              : AppThemeLight.instance.theme,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: ApplicationConstants.appName,
        );
      },
    );
  }
}
