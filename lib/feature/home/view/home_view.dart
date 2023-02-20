import 'package:flutter/material.dart';
import 'package:sozEBay/core/components/appbar/appbar.dart';
import 'package:sozEBay/feature/home/viewmodel/home_viewmodel.dart';

import '../../../core/components/buttons/home_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel model = HomeViewModel();
  bool changeIcon = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Banner
              const CustomBanner(),
              const SizedBox(height: 50),
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
        ),
      ),
    );
  }
}
