// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    DictionaryRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const DictionaryView(),
      );
    },
    ImagesRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ImagesView(),
      );
    },
    AlarmRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AlarmView(),
      );
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SettingsView(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        RouteConfig(
          HomeRoute.name,
          path: 'home',
          children: [
            RouteConfig(
              DictionaryRoute.name,
              path: 'dictionary',
              parent: HomeRoute.name,
            ),
            RouteConfig(
              ImagesRoute.name,
              path: 'images',
              parent: HomeRoute.name,
            ),
            RouteConfig(
              AlarmRoute.name,
              path: 'alarm',
              parent: HomeRoute.name,
            ),
            RouteConfig(
              SettingsRoute.name,
              path: 'settings',
              parent: HomeRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [DictionaryView]
class DictionaryRoute extends PageRouteInfo<void> {
  const DictionaryRoute()
      : super(
          DictionaryRoute.name,
          path: 'dictionary',
        );

  static const String name = 'DictionaryRoute';
}

/// generated route for
/// [ImagesView]
class ImagesRoute extends PageRouteInfo<void> {
  const ImagesRoute()
      : super(
          ImagesRoute.name,
          path: 'images',
        );

  static const String name = 'ImagesRoute';
}

/// generated route for
/// [AlarmView]
class AlarmRoute extends PageRouteInfo<void> {
  const AlarmRoute()
      : super(
          AlarmRoute.name,
          path: 'alarm',
        );

  static const String name = 'AlarmRoute';
}

/// generated route for
/// [SettingsView]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: 'settings',
        );

  static const String name = 'SettingsRoute';
}
