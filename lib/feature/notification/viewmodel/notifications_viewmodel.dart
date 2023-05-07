import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../../product/constants/enums/string/string_constants.dart';
import '../view/notifications_view.dart';

class DailyNotification {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInitializationSettings =
      const AndroidInitializationSettings('mipmap/ic_launcher');

  void initializeNotification() async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: _androidInitializationSettings,
    );
    tz.initializeTimeZones();
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void scheduleNotification(BuildContext context, int hour, int minute) async {
    var notifications = Hive.box(SozEBayStringConstants.notifications);
    if (notifications.isNotEmpty){
      notifications.clear();
    }

    List _items = [];

    // Fetch content from the json file
    final String response = await rootBundle.loadString('assets/words/notification.json');
    final data = await json.decode(response);
    _items = data["items"][Random().nextInt(data["items"].length)];

    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'sozBayDailyNotification', 'channelName',
      importance: Importance.max,
      priority: Priority.high,
      visibility: NotificationVisibility.public,
      playSound: true,
      fullScreenIntent: true,
      color: Colors.blue,
      // largeIcon: FilePathAndroidBitmap(_items[2]),
      styleInformation: BigPictureStyleInformation(FilePathAndroidBitmap(_items[2])),
    );
    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Ashgabat'));
    var currentDateTime = tz.TZDateTime.from(DateTime(2023, 01, 01, hour, minute), tz.getLocation('Asia/Ashgabat'));//.now(tz.getLocation('Asia/Ashgabat')).add(const Duration(hours: 10));

    List storageData = [hour,minute];
    notifications.add(storageData);

    _flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      _items[0].toUpperCase(),
      _items[1],
      currentDateTime,
      notificationDetails,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.wallClockTime,
      androidAllowWhileIdle: true,
      matchDateTimeComponents: DateTimeComponents.time
    );
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NotificationsView()));
  }

  void deleteDailyNotification(BuildContext context) async {
    var notifications = Hive.box(SozEBayStringConstants.notifications);
    notifications.clear();
    _flutterLocalNotificationsPlugin.cancel(0);
  }
}
