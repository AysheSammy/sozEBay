import 'package:flutter/material.dart';

import '../../../constants/app/app_constants.dart';
import '../app_theme.dart';
import '../light/theme_light_interface.dart';

class AppThemeLight extends AppTheme with IThemeLight {
  static AppThemeLight? _instance;

  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance!;
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData.light().copyWith(
        textTheme: ThemeData.light()
            .textTheme
            .apply(fontFamily: ApplicationConstants.fontFamily),
        primaryTextTheme: ThemeData.light()
            .textTheme
            .apply(fontFamily: ApplicationConstants.fontFamily),
        colorScheme: _colorScheme,
        appBarTheme: _appBarTheme,
        tabBarTheme: _tabBarTheme,
        inputDecorationTheme: _inputDecorationTheme,
        textSelectionTheme: _textSelectionTheme,
        textButtonTheme: _textButtonTheme,
        elevatedButtonTheme: _elevatedButtonTheme,
        scaffoldBackgroundColor: colorSchemeLight!.alabaster,
        cardColor: _colorScheme.primary,
        iconTheme: _iconTheme,
      );

  ColorScheme get _colorScheme => ColorScheme(
        brightness: colorSchemeLight!.brightnessLight,
        primary: colorSchemeLight!.hintOfRed,
        onPrimary: colorSchemeLight!.textColor,
        secondary: colorSchemeLight!.athensGray,
        onSecondary: colorSchemeLight!.slateGray,
        error: colorSchemeLight!.alizarinCrimson,
        onError: colorSchemeLight!.alizarinCrimson,
        background: colorSchemeLight!.fireFly,
        onBackground: colorSchemeLight!.riverBed,
        surface: colorSchemeLight!.alizarinCrimson,
        onSurface: colorSchemeLight!.riverBed,
        onTertiary: colorSchemeLight!.buttonColor1,
        tertiary: colorSchemeLight!.buttonColor2,
        tertiaryContainer: colorSchemeLight!.bannerColor1,
        onTertiaryContainer: colorSchemeLight!.bannerColor2,
      );

  AppBarTheme get _appBarTheme => AppBarTheme(
        backgroundColor: colorSchemeLight!.transparent,
        systemOverlayStyle: colorSchemeLight!.systemOverlayStyle,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(color: _colorScheme.onPrimary),
      );

  IconThemeData get _iconTheme => IconThemeData(
        color: colorSchemeLight!.alizarinCrimson,
        size: 20,
      );

  TabBarTheme get _tabBarTheme => TabBarTheme(
        labelColor: _colorScheme.background,
        unselectedLabelColor: _colorScheme.onSecondary,
        labelStyle: const TextStyle(fontWeight: FontWeight.w700),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 2.0,
            color: _colorScheme.background,
          ),
        ),
      );

  InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
        fillColor: colorSchemeLight!.hintOfRed,
        hintStyle: TextStyle(color: _colorScheme.onSecondary, fontSize: 16),
      );

  TextSelectionThemeData get _textSelectionTheme => TextSelectionThemeData(
        cursorColor: _colorScheme.background,
        selectionColor: _colorScheme.secondary,
        selectionHandleColor: _colorScheme.background,
      );

  TextButtonThemeData get _textButtonTheme => TextButtonThemeData(
          style: TextButton.styleFrom(
        foregroundColor: colorSchemeLight!.transparent,
        backgroundColor: _colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        elevation: 2,
      ));

  ElevatedButtonThemeData get _elevatedButtonTheme => ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: colorSchemeLight!.transparent,
        foregroundColor: _colorScheme.background,
        shadowColor: _colorScheme.primary,
        elevation: 0,
      ));
}
