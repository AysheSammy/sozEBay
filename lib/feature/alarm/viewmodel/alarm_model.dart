import 'package:hive_flutter/hive_flutter.dart';

part 'alarm_model.g.dart';

@HiveType(typeId: 1)
class Alarm extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late int hour;

  @HiveField(2)
  late int minute;

  @HiveField(3)
  late List activeDays;

  @HiveField(4)
  late bool isActive;
}
