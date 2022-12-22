import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../feature/home/view/home_view.dart';
import '../../../feature/splash/view/splash_view.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
    replaceInRouteName: 'View,Route',
    routes: <AutoRoute>[
      AutoRoute(page: SplashView, path: '/', initial: true),
      AutoRoute(page: HomeView, path: 'home', children: [
      ]),
    ]
)
class AppRouter extends _$AppRouter {}