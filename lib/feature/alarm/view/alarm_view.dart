import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sozEbay/core/components/alarm/alarm_instance.dart';
import 'package:sozEbay/feature/alarm/viewmodel/show_new_alarm_bottom_sheet.dart';
import 'package:sozEbay/product/constants/enums/string/string_constants.dart';

import '../../../product/init/language/locale_keys.g.dart';
import '../viewmodel/alarm_window.dart';

class AlarmView extends StatefulWidget {
  const AlarmView({Key? key}) : super(key: key);

  @override
  State<AlarmView> createState() => _AlarmViewState();
}


class _AlarmViewState extends State<AlarmView> {

  late Map alarms = {};
  @override
  void initState() {
    super.initState();
    alarms = Hive.box(SozEBayStringConstants.alarms).toMap();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/colored_bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.home_alarm.tr()),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: alarms.values.isNotEmpty
                  ? List.generate(
                      alarms.values.length,
                      (index) => AlarmInstance(
                        id: index,
                        label: alarms.values.toList()[index].title,
                        days: alarms.values.toList()[index].activeDays,
                        alarmTime: "${alarms.values.toList()[index].hour}:${alarms.values.toList()[index].minute}",
                        isActive: alarms.values.toList()[index].isActive,
                      ),
                    )
                  : [
                      Center(
                        child: Text(
                          "There is no alarms yet...",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.onSecondary
                          ),
                        ),
                      )
                    ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) => const NewAlarmBottomSheet(),
              );
            },
            backgroundColor: Theme.of(context).colorScheme.error,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    await Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (context) => const AlarmWindow()),
    );
  }
}
