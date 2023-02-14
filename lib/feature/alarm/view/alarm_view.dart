import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../product/init/language/locale_keys.g.dart';

class AlarmView extends StatefulWidget {
  const AlarmView({Key? key}) : super(key: key);

  @override
  State<AlarmView> createState() => _AlarmViewState();
}

class _AlarmViewState extends State<AlarmView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.home_alarm.tr()),
      ),
      body: Column(),
    );
  }
}
