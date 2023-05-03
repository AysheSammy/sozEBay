import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sozEbay/feature/notification/viewmodel/notifications_viewmodel.dart';
import 'package:sozEbay/product/constants/enums/string/string_constants.dart';
import 'package:sozEbay/product/init/language/locale_keys.g.dart';

import '../../../core/components/alarm/alarm_numbers.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  DailyNotification dailyNotification = DailyNotification();

  int hour = 6;
  int minute = 0;

  @override
  void initState() {
    super.initState();
    dailyNotification.initializeNotification();
    var notification = Hive.box(SozEBayStringConstants.notifications);
    if (notification.isNotEmpty) {
      hour = notification.values.toList()[0][0];
      minute = notification.values.toList()[0][1];
    }
  }

  bool isNotificationOn = true;

  @override
  Widget build(BuildContext context) {
    bool isRussian = context.locale == const Locale('ru_RU');

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.home_notifications.tr()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SwitchListTile(
              //TODO: localize here: LocaleKeys.settings_allowNotification.tr(), LocaleKeys.settings_notificationSubtitle.tr()
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  isRussian ? "Разрешить уведомление" : "Bildirişlere rugsat bermek",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
              subtitle: Text(
                isRussian
                    ? "Если уведомления разрешены, вы будете знакомиться с новыми латинскими словами каждый день."
                    : "Bildirişlere rugsat berilen ýagdaýynda gündelik täze latyn sözler bilen tanyş bolarsyňyz.",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              value: isNotificationOn,
              activeColor: Theme.of(context).colorScheme.error,
              onChanged: (bool? val) {
                setState(() {
                  isNotificationOn = isNotificationOn ? false : true;
                });
                if (isNotificationOn) {
                  dailyNotification.scheduleNotification(context, hour, minute);
                } else {
                  dailyNotification.deleteDailyNotification(context);
                }
              },
            ),
            const SizedBox(height: 20),

            //=================== Time ================================
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Hours
                SizedBox(
                  width: 80,
                  height: 300,
                  child: ListWheelScrollView.useDelegate(
                    controller: FixedExtentScrollController(initialItem: hour),
                    itemExtent: 50,
                    perspective: 0.005,
                    diameterRatio: 1.2,
                    useMagnifier: true,
                    magnification: 1.2,
                    overAndUnderCenterOpacity: 0.6,
                    onSelectedItemChanged: (value) {
                      hour = value;
                    },
                    physics: const FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 24,
                      builder: (context, index) {
                        return AlarmNumbers(number: index);
                      },
                    ),
                  ),
                ),
                Text(
                  ':',
                  style: TextStyle(
                    fontSize: 40,
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //Minutes
                SizedBox(
                  width: 80,
                  height: 300,
                  child: ListWheelScrollView.useDelegate(
                    controller: FixedExtentScrollController(initialItem: minute),
                    itemExtent: 50,
                    perspective: 0.005,
                    diameterRatio: 1.2,
                    useMagnifier: true,
                    magnification: 1.2,
                    overAndUnderCenterOpacity: 0.6,
                    onSelectedItemChanged: (value) {
                      minute = value;
                    },
                    physics: const FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 60,
                      builder: (context, index) {
                        return AlarmNumbers(number: index);
                      },
                    ),
                  ),
                ),
              ],
            ),

            // isNotificationOn ? Text('Hour ($hour)') : const SizedBox(),
            // isNotificationOn ? Slider(
            //   label: "Hour",
            //   value: hour.toDouble(),
            //   min: 1,
            //   max: 24,
            //   activeColor: Theme.of(context).colorScheme.error,
            //   thumbColor: Theme.of(context).colorScheme.error,
            //   inactiveColor: Theme.of(context).colorScheme.primary,
            //   onChanged: (val) {
            //     setState(() {
            //       hour = val.toInt();
            //     });
            //   },
            // ) : const SizedBox(),
            // isNotificationOn ? const SizedBox(height: 20) : const SizedBox(),
            // isNotificationOn ? Text('Minute ($minute)') : const SizedBox(),
            // isNotificationOn ? Slider(
            //   label: "Minute",
            //   value: minute.toDouble(),
            //   min: 0,
            //   max: 60,
            //   activeColor: Theme.of(context).colorScheme.error,
            //   thumbColor: Theme.of(context).colorScheme.error,
            //   inactiveColor: Theme.of(context).colorScheme.primary,
            //   onChanged: (val) {
            //     setState(() {
            //       minute = val.toInt();
            //     });
            //   },
            // ) : const SizedBox(),
            isNotificationOn
                ? ElevatedButton(
                    onPressed: () {
                      setState(() {
                        dailyNotification.deleteDailyNotification(context);
                        dailyNotification.scheduleNotification(context, hour, minute);
                      });
                    },
                    child: Text(isRussian ? "Установить уведомление" : "Bildiriş goş"),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
