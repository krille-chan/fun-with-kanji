import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ConfigToggle extends StatefulWidget {
  final String configKey;
  final String title;
  final IconData icon;
  const ConfigToggle({
    required this.configKey,
    required this.title,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  State<ConfigToggle> createState() => _ConfigToggleState();
}

class _ConfigToggleState extends State<ConfigToggle> {
  void _toggle(SharedPreferences preferences, bool value) async {
    await preferences.setBool(widget.configKey, value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) => SwitchListTile.adaptive(
          secondary: Icon(widget.icon),
          controlAffinity: ListTileControlAffinity.trailing,
          title: Text(widget.title),
          value: snapshot.data?.getBool(widget.configKey) ?? true,
          onChanged:
              snapshot.hasData ? (b) => _toggle(snapshot.data!, b) : null,
        ),
      );
}
