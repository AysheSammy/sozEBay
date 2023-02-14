import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../product/init/language/locale_keys.g.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
    Map<String, Locale> locals = {
      'tm': const Locale('en', 'EN'),
      'ru': const Locale('ru', 'RU')
    };
    List<String> languages = ['Türkmençe', 'Русский'];
    String ?currentLang; //= context.locale.toString() == 'en_EN' ? 'Türkmençe' : 'Русский';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.home_settings.tr()),
        centerTitle: true,
        // actions: [
        // IconButton(
        //   onPressed: () {
        //     showSearch(context: context, delegate: MySearchDelegate());
        //   },
        //   icon: const Icon(Icons.search),
        // ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: DropdownButton(
                hint: Text(LocaleKeys.settings_language.tr()),
                value: currentLang,
                alignment: AlignmentDirectional.centerEnd,
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                iconSize: 30,
                items: languages.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  debugPrint(context.locale.toString()); // context.locale.toString();
                  setState(() {
                    Locale? newLocale = value == 'Türkmençe' ? locals['tm'] : locals['ru'];
                    context.setLocale(newLocale!);
                    currentLang = value!;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
