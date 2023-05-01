import 'package:flutter/material.dart';

class AlarmWindow extends StatefulWidget {
  const AlarmWindow({Key? key, payload});

  @override
  State<AlarmWindow> createState() => _AlarmWindowState();
}

class _AlarmWindowState extends State<AlarmWindow> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            now.toString(),
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onPrimary),
          ),

        ],
      ),
    );
  }
}
