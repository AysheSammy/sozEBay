import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sozEbay/product/constants/enums/string/string_constants.dart';

import '../../../product/init/language/locale_keys.g.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  var curr_loc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    curr_loc = Hive.box(SozEBayStringConstants.settings);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.home_settings.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                curr_loc == const Locale('en_EN')
                    ? 'Türkmenistanyň saglygy goraýyş we derman senagaty ministrligi \n Myrat Garryýew adyndaky Türkmenistanyň döwlet uniwersiteti\n\n Ylmy ýolbaşçy:\n   MerjenBerdiýewa Abdykerimowna\n\n Ýerine ýetirijiler:\n   Jennet Myradowa,\n   Nazar Gurbanow Döwletmyradowiç\n\n Internet adresimiz:\n   sozebay@gmail.com\n\nTelefon belgimiz:\n   +99361758902'
                    : 'Türkmenistanyň saglygy goraýyş we derman senagaty ministrligi \n Myrat Garryýew adyndaky Türkmenistanyň döwlet uniwersiteti\n\n Ylmy ýolbaşçy:\n   MerjenBerdiýewa Abdykerimowna\n\n Ýerine ýetirijiler:\n   Jennet Myradowa,\n   Nazar Gurbanow Döwletmyradowiç\n\n Internet adresimiz:\n   sozebay@gmail.com\n\nTelefon belgimiz:\n   +99361758902',

                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Theme.of(context).colorScheme.onPrimary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
