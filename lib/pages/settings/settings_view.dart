import 'package:flutter/material.dart';
import 'package:fun_with_kanji/config/config_keys.dart';
import 'package:fun_with_kanji/pages/settings/config_toggle.dart';
import 'package:fun_with_kanji/pages/settings/settings.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class SettingsView extends StatelessWidget {
  final SettingsController controller;
  const SettingsView(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(L10n.of(context)!.settings)),
      body: ListView(
        children: [
          ConfigToggle(
            icon: Icons.record_voice_over_outlined,
            title: L10n.of(context)!.readOutLoud,
            configKey: ConfigKeys.readOutLoud,
          ),
          ConfigToggle(
            icon: Icons.volume_up_outlined,
            title: L10n.of(context)!.playSoundEffects,
            configKey: ConfigKeys.playSoundEffects,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.delete_outlined),
            title: Text(L10n.of(context)!.resetLearningProgress),
            onTap: controller.resetLearningProgressAction,
          ),
          ListTile(
            leading: const Icon(Icons.save_outlined),
            title: Text(L10n.of(context)!.exportLearningProgress),
            onTap: controller.exportAction,
          ),
          ListTile(
            leading: const Icon(Icons.restore_outlined),
            title: Text(L10n.of(context)!.importLearningProgress),
            onTap: controller.importAction,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.domain_outlined),
            title: Text(L10n.of(context)!.website),
            onTap: controller.openWebsite,
          ),
          ListTile(
            leading: const Icon(Icons.info_outlined),
            title: Text(L10n.of(context)!.about),
            onTap: controller.displayAboutDialog,
          ),
        ],
      ),
    );
  }
}
