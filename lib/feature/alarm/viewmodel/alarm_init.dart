import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sozEbay/feature/alarm/viewmodel/alarm_model.dart';
import 'package:sozEbay/product/constants/enums/string/string_constants.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalAlarmSettings {
  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @pragma('vm:entry-point')
  initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    _flutterLocalNotificationsPlugin = flutterLocalNotificationsPlugin;
    var androidInitialize = const AndroidInitializationSettings('mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(android: androidInitialize);
    tz.initializeTimeZones();
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!
        .requestPermission();
  }

  static void notificationTapBackground(NotificationResponse details) {}

  void setAlarm(String title, int hour, int min, List activeDays) {
    Alarm _alarm = Alarm()
      ..title = title
      ..hour = hour
      ..minute = min < 10 ? min : min
      ..activeDays = activeDays
      ..isActive = true;

    // Store in hive object
    var alarms = Hive.box(SozEBayStringConstants.alarms);
    alarms.add(_alarm);

    int id = Hive.box(SozEBayStringConstants.alarms).values.length;

    AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
      'sozBayDailyNotification', 'channelName',
      importance: Importance.max,
      priority: Priority.high,
      visibility: NotificationVisibility.public,
      playSound: true,
      fullScreenIntent: true,
      color: Colors.blue,
      enableLights: true,
      enableVibration: true,
      ongoing: true
      // largeIcon: FilePathAndroidBitmap(_items[2]),
    );
    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Ashgabat'));
    var currentDateTime = tz.TZDateTime.from(DateTime(2023, 01, 01, hour, min), tz.getLocation('Asia/Ashgabat'));

    _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      "",
      currentDateTime,
      notificationDetails,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );

    _flutterLocalNotificationsPlugin.periodicallyShow(id, title, 'body', RepeatInterval.values[1], notificationDetails);
  }

  static void inActivateAlarmInstance(int id) {
    var alarm = Hive.box(SozEBayStringConstants.alarms).getAt(id);
    alarm.isActive = false;
    alarm.save();
  }

  static void deleteAlarmInstance(int id) {
    Hive.box(SozEBayStringConstants.alarms).deleteAt(id);
  }

  static Future showBigTextNotification(
      {int id = 0,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'you_can_name_it_whatever',
      'channel_name',
      playSound: true,
      // sound: RawResourceAndroidNotificationSound('notification'),
      importance: Importance.max,
      priority: Priority.high,
    );

    var not = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await fln.show(id, title, body, not);
  }
}
