import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instance;
  static ColorSchemeLight? get instance {
    _instance ??= ColorSchemeLight._init();
    return _instance;
  }

  ColorSchemeLight._init();

  final RadialGradient prettyPink = const RadialGradient(colors: [
    Color.fromRGBO(243, 0, 0, 0.33),
    Color.fromRGBO(74, 55, 226, 0.33)
  ]);

  final RadialGradient buttonGradient = const RadialGradient(colors: [
    Color.fromRGBO(237, 184, 184, 1),
    Color.fromRGBO(135, 122, 231, 1),
  ]);

  final Color textColor = const Color.fromRGBO(41, 50, 65, 1);




  final Color alizarinCrimson = const Color(0xffF7941D);
  final Color alabaster = const Color(0xffE0FBFC);
  final Color athensGray = const Color(0xff98C1D9);
  final Color hintOfRed = const Color(0xffFDFCFC);

  final Color fireFly = const Color(0xff0A151F);
  final Color riverBed = const Color(0xff293241);
  final Color slateGray = const Color(0xff4A1C77);

  final Brightness brightnessLight = Brightness.light;
  final SystemUiOverlayStyle systemOverlayStyle = SystemUiOverlayStyle.light;

  final Color transparent = Colors.transparent;
}
