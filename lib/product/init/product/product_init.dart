import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../core/init/theme/notifier/theme_notifier.dart';
import '../language/localization_init.dart';

class ProductInit {

  final localizationInit = LocalizationInit();

  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider<ThemeNotifier>(
      create: (context) => ThemeNotifier(),
    ),

  ];

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
  }
}
