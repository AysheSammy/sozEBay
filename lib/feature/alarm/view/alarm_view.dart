import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sozEBay/core/components/alarm/alarm_instance.dart';

import '../../../product/init/language/locale_keys.g.dart';
import '../viewmodel/alarm_info.dart';
import '../viewmodel/alarm_helper.dart';
import '../viewmodel/alarm_viewmodel.dart';

class AlarmView extends StatefulWidget {
  const AlarmView({Key? key}) : super(key: key);

  @override
  State<AlarmView> createState() => _AlarmViewState();
}

class _AlarmViewState extends State<AlarmView> {
  // DateTime? _alarmTime;
  // late String _alarmTimeString;
  // bool _isRepeatSelected = false;
  // AlarmHelper _alarmHelper = AlarmHelper();
  // Future<List<AlarmInfo>>? _alarms;
  // List<AlarmInfo>? _currentAlarms;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.home_alarm.tr()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AlarmInstance(
              label: 'Office',
              days: 'Mon-Tue',
              alarmTime: '09:20 AM',
              isActive: true,
            ),
            AlarmInstance(
              label: 'Work',
              days: 'Mon-Tue',
              alarmTime: '09:20 AM',
              isActive: true,
            ),
            AlarmInstance(
              label: 'Office',
              days: 'Mon-Tue',
              alarmTime: '09:20 AM',
              isActive: true,
            ),
            AlarmInstance(
              label: 'Office',
              days: 'Mon-Tue',
              alarmTime: '09:20 AM',
              isActive: true,
            ),
          ],
        ),
      ),
    );
  }

// void deleteAlarm(int? id) {}
}
