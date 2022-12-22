import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sozEBay/pages/alarm_page.dart';
import 'package:sozEBay/pages/dictionary_page.dart';
import 'package:sozEBay/pages/images_page.dart';
import 'package:sozEBay/pages/notification_page.dart';

import '../../../core/constants/app/app_constants.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  List buttons = [
    ["Dictionary", const DictionaryPage(), Icons.receipt_long_rounded, Colors.white],
    ["Images", const ImagesPage(), Icons.image_outlined, Colors.white],
    ["Notification", const NotificationPage(), Icons.notifications_active_outlined, Colors.white],
    ["Alarm", const AlarmPage(), Icons.alarm, Colors.white]
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 15),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.sunny,
              color: Color.fromRGBO(238, 108, 77, 1),
            ),
            selectedIcon: const Icon(
              Icons.mode_night,
              color: Color.fromRGBO(238, 108, 77, 1),
            ),
            iconSize: 25,
          ),
        ),
      ),
      body: Column(
        children: [
          // Banner
          Container(
            margin: const EdgeInsets.only(bottom: 50),
            width: size.width,
            height: size.height * 0.33,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(41, 50, 65, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SvgPicture.asset(
                    ApplicationConstants.logoName,
                    width: 150,
                    height: 150,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    ApplicationConstants.appName,
                    style: TextStyle(
                      color: Color.fromRGBO(224, 251, 252, 1),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Buttons
          Column(
            children: List.generate(
              buttons.length,
                  (ind) => Padding(
                padding: const EdgeInsets.only(top: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => buttons[ind][1],
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: size.width * 0.8,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(61, 90, 128, 1),
                          Color.fromRGBO(74, 28, 119, 1),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(buttons[ind][2], color: buttons[ind][3],),
                        Text(
                          buttons[ind][0],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(224, 251, 252, 1),
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios_rounded, color: Colors.white,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
