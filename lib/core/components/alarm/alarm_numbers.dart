import 'package:flutter/material.dart';

class AlarmNumbers extends StatelessWidget {
  final int number;

  const AlarmNumbers({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Center(
        child: Text(
          number < 10 ? '0$number' : number.toString(),
          style: TextStyle(
            fontSize: 40,
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
