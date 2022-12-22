import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorSchemeDark {
  static ColorSchemeDark? _instance;
  static ColorSchemeDark? get instance {
    _instance ??= ColorSchemeDark._init();
    return _instance;
  }

  ColorSchemeDark._init();

  final RadialGradient prettyBlue = const RadialGradient(colors: [
    Color.fromRGBO(36, 13, 102, 1),
    Color.fromRGBO(8, 7, 50, 1),
  ]);

  final RadialGradient buttonGradient = const RadialGradient(colors: [
    Color.fromRGBO(89, 86, 212, 1),
    Color.fromRGBO(0, 7, 36, 1),
  ]);

  final Color textColor = const Color.fromRGBO(41, 50, 65, 1);
  final Color codGray = const Color.fromRGBO(0, 7, 36, 1);
  final Color alto = const Color(0xffE0FBFC);
  final Color mineShaft = const Color(0xff252525);
  final Color hitGray = const Color(0xffd1cfcf);
  final Color alizarinCrimson = const Color(0xffF7941D);
  final Color silverSand = const Color(0xffb6b8ba);
  final Color shark = const Color(0xff293241);

  final Brightness brightnessDark = Brightness.dark;
  final SystemUiOverlayStyle systemOverlayStyle = SystemUiOverlayStyle.light;
  final Color transparent = Colors.transparent;
}
