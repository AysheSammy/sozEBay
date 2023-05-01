import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sozEbay/feature/alarm/view/alarm_view.dart';
import 'package:sozEbay/feature/alarm/viewmodel/alarm_init.dart';

class AlarmInstance extends StatefulWidget {
  final int id;
  final String label;
  final List days;
  final String alarmTime;
  bool isActive;

  AlarmInstance({
    super.key,
    required this.id,
    required this.label,
    required this.days,
    required this.alarmTime,
    required this.isActive,
  });

  @override
  State<AlarmInstance> createState() => _AlarmInstanceState();
}

class _AlarmInstanceState extends State<AlarmInstance> {
  @override
  Widget build(BuildContext context) {
    String activeDays = '';
    List engDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    for (int i = 0; i < widget.days.length; i++) {
      if (widget.days[i]) {
        activeDays == "" ? activeDays += engDays[i] : activeDays += ', ' + engDays[i];
      }
    }
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 140,
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.keyboard_double_arrow_right_rounded,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  Text(
                    widget.label,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  LocalAlarmSettings.deleteAlarmInstance(widget.id);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const AlarmView()),
                  );
                },
                child: Icon(
                  Icons.restore_from_trash_outlined,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 30,
                ),
              )
            ],
          ),
          Text(
            activeDays,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.alarmTime,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Switch(
                value: widget.isActive,
                onChanged: (bool? value) {
                  setState(() {
                    widget.isActive = !widget.isActive;
                    LocalAlarmSettings.inActivateAlarmInstance(widget.id);
                    setState(() {});
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
