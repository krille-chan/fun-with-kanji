import 'package:flutter/material.dart';
import 'package:funny_kanji/models/funny_kanji.dart';
import 'package:funny_kanji/pages/settings/settings_view.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  SettingsController createState() => SettingsController();
}

class SettingsController extends State<SettingsPage> {
  void resetLearningProgressAction() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(L10n.of(context)!.areYouSure),
        content: Text(L10n.of(context)!.resetLearningProgress),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop<bool>(false),
            child: Text(
              L10n.of(context)!.cancel,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText2?.color,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop<bool>(true),
            child: Text(
              L10n.of(context)!.reset,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
    if (result != true) return;
    await FunnyKanji.of(context).resetLearningProgress();
  }

  @override
  Widget build(BuildContext context) => SettingsView(this);
}
