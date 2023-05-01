import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sozEbay/core/components/alarm/alarm_numbers.dart';
import 'package:sozEbay/feature/alarm/view/alarm_view.dart';
import 'package:sozEbay/feature/alarm/viewmodel/alarm_init.dart';
import 'package:sozEbay/feature/alarm/viewmodel/alarm_model.dart';

class NewAlarmBottomSheet extends StatefulWidget {
  const NewAlarmBottomSheet({Key? key}) : super(key: key);

  @override
  State<NewAlarmBottomSheet> createState() => _NewAlarmBottomSheetState();
}

class _NewAlarmBottomSheetState extends State<NewAlarmBottomSheet> {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  int hour = DateTime.now().hour;
  int minute = DateTime.now().minute;
  String title = 'New Alarm';
  List tkmDays = ['Duş', 'Siş', 'Çar', 'Pen', 'Jum', 'Şen', 'Ýek'];
  List engDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List rsnDays = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
  List activeList = [false, false, false, false, false, false, false];


  @override
  void initState() {
    int ind = engDays.indexOf(DateFormat('E').format(DateTime.now()).toString());
    activeList[ind] = true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 750,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //=================== Inputs ================================
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //=================== Title ================================
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 15),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Alarm title',
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                    hintText: title,
                    border: InputBorder.none,
                  ),
                  onChanged: (val) {
                    title = val;
                  },
                ),
              ),

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

              const SizedBox(height: 20),
              // ================== Repeat ==============================
              const Text(
                'Repeat',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: List.generate(
                  7,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        activeList[index] = activeList[index] ? false : true;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 3),
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          color:  activeList[index] ? Theme.of(context).colorScheme.error : Colors.grey[300],
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          context.locale.toString() == 'en_EN' ? tkmDays[index] : rsnDays[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // ================== Buttons ==============================
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).replace(const PageRouteInfo("AlarmView", path: '/home/alarm'));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  LocalAlarmSettings alarm = LocalAlarmSettings();
                  await LocalAlarmSettings().initialize(_flutterLocalNotificationsPlugin);
                  alarm.setAlarm(
                    title,
                    hour,
                    minute,
                    activeList
                  );
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const AlarmView()),
                  );
                  // setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).colorScheme.error,
                  ),
                  child: const Center(
                    child: Text(
                      'Set alarm',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
