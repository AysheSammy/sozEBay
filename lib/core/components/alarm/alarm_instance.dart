import 'package:flutter/material.dart';

class AlarmInstance extends StatefulWidget {
  final String label;
  final String days;
  final String alarmTime;
  bool isActive;

  AlarmInstance({
    super.key,
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
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      height: 140,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          // color: Colors.transparent,
          boxShadow: [
            const BoxShadow(
              color: Colors.black54,
            ),
            BoxShadow(
              color: Theme.of(context).backgroundColor,
              spreadRadius: -6.0,
              blurRadius: 6.0,
            ),
            const BoxShadow(
              color: Color.fromRGBO(155, 155, 155, 0.25),
              blurRadius: 10,
              offset: Offset(-3, -3),
            ),
            const BoxShadow(
              color: Color.fromRGBO(155, 155, 155, 0.25),
              blurRadius: 10,
              offset: Offset(3, 3),
            ),
          ]),
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
              Switch(
                  value: widget.isActive,
                  onChanged: (bool? value) {
                    widget.isActive = !widget.isActive;
                    setState(() {});
                  }),
            ],
          ),
          Text(
            widget.days,
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
              GestureDetector(
                onTap: () {
                  //  TODO: fill the action
                },
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 30,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
