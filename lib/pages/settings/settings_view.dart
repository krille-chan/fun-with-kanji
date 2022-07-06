import 'package:flutter/material.dart';
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
