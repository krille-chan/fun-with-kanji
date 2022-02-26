import 'package:flutter/material.dart';
import 'package:funny_kanji/pages/settings/settings_view.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  SettingsController createState() => SettingsController();
}

class SettingsController extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) => SettingsView(this);
}
