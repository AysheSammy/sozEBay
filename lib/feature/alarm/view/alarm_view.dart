import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../product/init/language/locale_keys.g.dart';
import '../viewmodel/alarm_info.dart';
import '../viewmodel/alarm_helper.dart';
import '../viewmodel/alarm_viewmodel.dart';

class AlarmView extends StatefulWidget {
  const AlarmView({Key? key}) : super(key: key);

  @override
  State<AlarmView> createState() => _AlarmViewState();
}

class _AlarmViewState extends State<AlarmView> {
  DateTime? _alarmTime;
  late String _alarmTimeString;
  bool _isRepeatSelected = false;
  AlarmHelper _alarmHelper = AlarmHelper();
  Future<List<AlarmInfo>>? _alarms;
  List<AlarmInfo>? _currentAlarms;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.home_alarm.tr()),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Expanded(
              //   child: FutureBuilder<List<AlarmInfo>>(
              //     future: _alarms,
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData) {
              //         _currentAlarms = snapshot.data;
              //         return ListView(
              //           children: snapshot.data!.map<Widget>((alarm) {
              //             var alarmTime = DateFormat('hh:mm aa').format(alarm.alarmDateTime!);
              //             var gradientColor = GradientTemplate.gradientTemplate[alarm.gradientColorIndex!].colors;
              //             return Container(
              //               margin: const EdgeInsets.only(bottom: 32),
              //               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              //               decoration: BoxDecoration(
              //                 gradient: LinearGradient(
              //                   colors: gradientColor,
              //                   begin: Alignment.centerLeft,
              //                   end: Alignment.centerRight,
              //                 ),
              //                 boxShadow: [
              //                   BoxShadow(
              //                     color: gradientColor.last.withOpacity(0.4),
              //                     blurRadius: 8,
              //                     spreadRadius: 2,
              //                     offset: Offset(4, 4),
              //                   ),
              //                 ],
              //                 borderRadius: BorderRadius.all(Radius.circular(24)),
              //               ),
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: <Widget>[
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                     children: <Widget>[
              //                       Row(
              //                         children: <Widget>[
              //                           Icon(
              //                             Icons.label,
              //                             color: Colors.white,
              //                             size: 24,
              //                           ),
              //                           SizedBox(width: 8),
              //                           Text(
              //                             alarm.title!,
              //                             style: TextStyle(color: Colors.white, fontFamily: 'avenir'),
              //                           ),
              //                         ],
              //                       ),
              //                       Switch(
              //                         onChanged: (bool value) {},
              //                         value: true,
              //                         activeColor: Colors.white,
              //                       ),
              //                     ],
              //                   ),
              //                   Text(
              //                     'Mon-Fri',
              //                     style: TextStyle(color: Colors.white, fontFamily: 'avenir'),
              //                   ),
              //                   Row(
              //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                     children: <Widget>[
              //                       Text(
              //                         alarmTime,
              //                         style: TextStyle(
              //                             color: Colors.white, fontFamily: 'avenir', fontSize: 24, fontWeight: FontWeight.w700),
              //                       ),
              //                       IconButton(
              //                           icon: Icon(Icons.delete),
              //                           color: Colors.white,
              //                           onPressed: () {
              //                             deleteAlarm(alarm.id);
              //                           }),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             );
              //           }).followedBy([
              //             if (_currentAlarms!.length < 5)
              //              Container(
              //                   width: double.infinity,
              //                   decoration: BoxDecoration(
              //                     // color: CustomColors.clockBG,
              //                     borderRadius: BorderRadius.all(Radius.circular(24)),
              //                   ),
              //                   child: MaterialButton(
              //                     padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              //                     onPressed: () {
              //                       _alarmTimeString = DateFormat('HH:mm').format(DateTime.now());
              //                       showModalBottomSheet(
              //                         useRootNavigator: true,
              //                         context: context,
              //                         clipBehavior: Clip.antiAlias,
              //                         shape: RoundedRectangleBorder(
              //                           borderRadius: BorderRadius.vertical(
              //                             top: Radius.circular(24),
              //                           ),
              //                         ),
              //                         builder: (context) {
              //                           return StatefulBuilder(
              //                             builder: (context, setModalState) {
              //                               return Container(
              //                                 padding: const EdgeInsets.all(32),
              //                                 child: Column(
              //                                   children: [
              //                                     TextButton(
              //                                       onPressed: () async {
              //                                         var selectedTime = await showTimePicker(
              //                                           context: context,
              //                                           initialTime: TimeOfDay.now(),
              //                                         );
              //                                         if (selectedTime != null) {
              //                                           final now = DateTime.now();
              //                                           var selectedDateTime = DateTime(
              //                                               now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);
              //                                           _alarmTime = selectedDateTime;
              //                                           setModalState(() {
              //                                             _alarmTimeString = DateFormat('HH:mm').format(selectedDateTime);
              //                                           });
              //                                         }
              //                                       },
              //                                       child: Text(
              //                                         _alarmTimeString,
              //                                         style: TextStyle(fontSize: 32),
              //                                       ),
              //                                     ),
              //                                     ListTile(
              //                                       title: Text('Repeat'),
              //                                       trailing: Switch(
              //                                         onChanged: (value) {
              //                                           setModalState(() {
              //                                             _isRepeatSelected = value;
              //                                           });
              //                                         },
              //                                         value: _isRepeatSelected,
              //                                       ),
              //                                     ),
              //                                     ListTile(
              //                                       title: Text('Sound'),
              //                                       trailing: Icon(Icons.arrow_forward_ios),
              //                                     ),
              //                                     ListTile(
              //                                       title: Text('Title'),
              //                                       trailing: Icon(Icons.arrow_forward_ios),
              //                                     ),
              //                                     FloatingActionButton.extended(
              //                                       onPressed: () {
              //                                         // onSaveAlarm(_isRepeatSelected);
              //                                       },
              //                                       icon: Icon(Icons.alarm),
              //                                       label: Text('Save'),
              //                                     ),
              //                                   ],
              //                                 ),
              //                               );
              //                             },
              //                           );
              //                         },
              //                       );
              //                       // scheduleAlarm();
              //                     },
              //                     child: Column(
              //                       children: <Widget>[
              //                         Image.asset(
              //                           'assets/add_alarm.png',
              //                           scale: 1.5,
              //                         ),
              //                         SizedBox(height: 8),
              //                         Text(
              //                           'Add Alarm',
              //                           style: TextStyle(color: Colors.white, fontFamily: 'avenir'),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 )
              //             else
              //               Center(
              //                   child: Text(
              //                     'Only 5 alarms allowed!',
              //                     style: TextStyle(color: Colors.white),
              //                   )),
              //           ]).toList(),
              //         );
              //       }
              //       return Center(
              //         child: Text(
              //           'Loading..',
              //           style: TextStyle(color: Colors.white),
              //         ),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void deleteAlarm(int? id) {}
}
