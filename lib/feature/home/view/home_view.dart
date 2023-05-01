import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sozEbay/core/constants/app/app_constants.dart';
import 'package:sozEbay/core/init/theme/notifier/theme_notifier.dart';
import 'package:sozEbay/feature/home/viewmodel/home_viewmodel.dart';
import 'package:sozEbay/product/constants/enums/string/string_constants.dart';

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
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Banner
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  gradient: RadialGradient(colors: [
                    Theme.of(context).colorScheme.tertiaryContainer,
                    Theme.of(context).colorScheme.onTertiaryContainer,
                  ]),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // For theme change
                        GestureDetector(
                          onTap: () async {
                            model.themeChangeBox.put(
                                SozEBayStringConstants.settingsDarkMode,
                                !model.themeChangeBox
                                    .get(SozEBayStringConstants.settingsDarkMode, defaultValue: false));
                            context.read<ThemeNotifier>().changeTheme();
                            setState(() {
                              changeIcon = !changeIcon;
                            });
                          },
                          child: Icon(
                            changeIcon ? Icons.mode_night : Icons.sunny,
                            size: 30,
                            color: changeIcon ? Colors.indigo : Colors.orange,
                          ),
                        ),
                        // For language
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Locale? newLocale = context.locale.toString() == 'en_EN'
                                  ? const Locale('ru', 'RU')
                                  : const Locale('en', 'EN');
                              EasyLocalization.of(context)?.setLocale(newLocale);
                            });
                          },
                          child: SvgPicture.asset(
                            context.locale.toString() == 'en_EN' ? 'assets/icons/ru.svg' : 'assets/icons/tm.svg',
                            width: 30,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SvgPicture.asset(
                              ApplicationConstants.logoName,
                              height: (MediaQuery.of(context).size.height * 0.25) / 3,
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
                  ],
                ),
              ),
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
