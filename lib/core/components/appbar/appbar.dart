import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';

import '../../../feature/home/viewmodel/home_viewmodel.dart';
import '../../../product/constants/enums/string/string_constants.dart';
import '../../constants/app/app_constants.dart';
import '../../init/theme/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';


class CustomBanner extends StatefulWidget {

  const CustomBanner({Key? key}) : super(key: key);

  @override
  State<CustomBanner> createState() => _CustomBannerState();
}

class _CustomBannerState extends State<CustomBanner> {

  HomeViewModel model = HomeViewModel();
  bool changeIcon = false;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          GestureDetector(
            onTap: () async {
              model.themeChangeBox.put(SozEBayStringConstants.settingsDarkMode,
                  !model.themeChangeBox.get(SozEBayStringConstants.settingsDarkMode, defaultValue: false));
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
    );
  }
}

