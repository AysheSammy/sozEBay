import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../product/init/language/locale_keys.g.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.home_notifications.tr()),
      ),
      body: Column(),
    );
  }
}
