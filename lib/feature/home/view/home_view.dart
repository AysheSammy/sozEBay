import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sozEBay/feature/home/viewmodel/home_viewmodel.dart';

import '../../../core/components/buttons/home_button.dart';
import '../../../core/constants/app/app_constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        // leading: Padding(
        //   padding: const EdgeInsets.only(left: 20, top: 15),
        //   child: IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.sunny,
        //       color: Color.fromRGBO(238, 108, 77, 1),
        //     ),
        //     // selectedIcon: const Icon(
        //     //   Icons.mode_night,
        //     //   color: Color.fromRGBO(238, 108, 77, 1),
        //     // ),
        //     iconSize: 25,
        //   ),
        // ),
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
              HomeViewModel().viewButtons.length,
              (ind) => Padding(
                padding: const EdgeInsets.only(top: 20),
                child: HomeButton(
                  HomeViewModel().viewButtons[ind][1],
                  HomeViewModel().viewButtons[ind][2],
                  HomeViewModel().viewButtons[ind][3],
                  HomeViewModel().viewButtons[ind][0],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}