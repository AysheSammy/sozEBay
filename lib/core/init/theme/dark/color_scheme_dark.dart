import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorSchemeDark {
  static ColorSchemeDark? _instance;
  static ColorSchemeDark? get instance {
    _instance ??= ColorSchemeDark._init();
    return _instance;
  }

  ColorSchemeDark._init();
  final Color alto = const Color(0xffE0FBFC);
  final Color hitGray = const Color(0xff98C1D9);
  final Color silverSand = const Color(0xffb6b8ba);
  final Color shark = const Color(0xff293241);
  final Color codGray = const Color(0xff191919);

  final Color mineShaft = const Color(0xff252525);

  final Color alizarinCrimson = const Color(0xffF7941D);

  final Brightness brightnessDark = Brightness.dark;
  final SystemUiOverlayStyle systemOverlayStyle = SystemUiOverlayStyle.light;

  final Color transparent = Colors.transparent;
}
