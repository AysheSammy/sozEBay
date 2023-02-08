import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sozEBay/feature/dictionary/view/dictionary_view.dart';

import '../../../feature/alarm/view/alarm_view.dart';
import '../../../feature/home/view/home_view.dart';
import '../../../feature/notification/view/notifications_view.dart';
import '../../../feature/settings/view/settings_view.dart';
import '../../../feature/splash/view/splash_view.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(replaceInRouteName: 'View,Route', routes: <AutoRoute>[
  AutoRoute(page: SplashView, path: '/', initial: true),
  AutoRoute(page: HomeView, path: 'home', children: [
    AutoRoute(page: DictionaryView, path: 'dictionary'),
    AutoRoute(page: NotificationsView, path: 'images'),
    AutoRoute(page: AlarmView, path: 'alarm'),
    AutoRoute(page: SettingsView, path: 'settings'),
  ]),
])
class AppRouter extends _$AppRouter {}
