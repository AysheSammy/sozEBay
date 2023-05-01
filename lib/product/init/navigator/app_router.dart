import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sozEbay/feature/alarm/view/alarm_view.dart';
import 'package:sozEbay/feature/dictionary/view/dictionary_view.dart';
import 'package:sozEbay/feature/home/view/home_view.dart';
import 'package:sozEbay/feature/notification/view/notifications_view.dart';
import 'package:sozEbay/feature/settings/view/settings_view.dart';
import 'package:sozEbay/feature/splash/view/splash_view.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashView, path: '/', initial: true, name: 'SplashView'),
    AutoRoute(page: HomeView, path: 'home', children: [
      AutoRoute(page: DictionaryView, path: 'dictionary', name: 'DictionaryView'),
      AutoRoute(page: NotificationsView, path: 'images', name: 'NotificationView'),
      AutoRoute(page: AlarmView, path: 'alarm', name: 'AlarmView'),
      AutoRoute(page: SettingsView, path: 'settings', name: 'SettingsView'),
    ]),
  ],
)
class AppRouter extends _$AppRouter {}
