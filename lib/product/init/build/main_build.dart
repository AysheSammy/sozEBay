import 'package:flutter/material.dart';
import '../language/locale_keys.g.dart';
import 'package:kartal/kartal.dart';


class MainBuild {
  MainBuild._();
  static Widget build(BuildContext context, Widget? child) {
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return Text(
        LocaleKeys.info_anErrorOccured,
        textAlign: TextAlign.center,
        style: context.textTheme.titleLarge?.copyWith(color: context.colorScheme.background),
      );
    };
    return Column(
      children: [
        Expanded(
          child: child ?? const SizedBox.shrink(),
        ),
      ],
    );
  }
}
