import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sozEbay/feature/notification/viewmodel/notifications_viewmodel.dart';
import 'package:sozEbay/product/init/language/locale_keys.g.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  DailyNotification dailyNotification = DailyNotification();

  @override
  void initState() {
    super.initState();
    dailyNotification.initializeNotification();
  }

  bool isNotificationOn = true;
  int hour = 6;
  int minute = 0;

  @override
  Widget build(BuildContext context) {
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
                  "Allow notifications",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
              subtitle: Text(
                "Allowing this notification will send daily words for you.",
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
                  dailyNotification.scheduleNotification(hour, minute);
                } else {
                  dailyNotification.deleteDailyNotification();
                }
              },
            ),
            const SizedBox(height: 20),

            isNotificationOn ? Text('Hour ($hour)') : const SizedBox(),
            isNotificationOn ? Slider(
              label: "Hour",
              value: hour.toDouble(),
              min: 1,
              max: 24,
              activeColor: Theme.of(context).colorScheme.error,
              thumbColor: Theme.of(context).colorScheme.error,
              inactiveColor: Theme.of(context).colorScheme.primary,
              onChanged: (val) {
                setState(() {
                  hour = val.toInt();
                });
              },
            ) : const SizedBox(),
            isNotificationOn ? const SizedBox(height: 20) : const SizedBox(),
            isNotificationOn ? Text('Minute ($minute)') : const SizedBox(),
            isNotificationOn ? Slider(
              label: "Minute",
              value: minute.toDouble(),
              min: 0,
              max: 60,
              activeColor: Theme.of(context).colorScheme.error,
              thumbColor: Theme.of(context).colorScheme.error,
              inactiveColor: Theme.of(context).colorScheme.primary,
              onChanged: (val) {
                setState(() {
                  minute = val.toInt();
                });
              },
            ) : const SizedBox(),
            isNotificationOn ? ElevatedButton(
              onPressed: () {
                setState(() {
                  dailyNotification.deleteDailyNotification();
                  dailyNotification.scheduleNotification(hour, minute);
                });
              },
              child: const Text("Set notification"),
            ) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
