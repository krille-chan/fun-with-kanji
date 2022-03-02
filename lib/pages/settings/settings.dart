import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fun_with_kanji/config/app_constants.dart';
import 'package:fun_with_kanji/models/fun_with_kanji.dart';
import 'package:fun_with_kanji/pages/settings/settings_view.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:fun_with_kanji/utils/open_issue_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
    await FunWithKanji.of(context).resetLearningProgress();
  }

  void openWebsite() => launch(AppConstants.website);

  void displayAboutDialog() => showAboutDialog(
        context: context,
        applicationName: AppConstants.appName,
      );

  void exportAction() async {
    try {
      final export = await FunWithKanji.of(context).export();
      final exportStr = await compute(jsonEncode, export);
      final tmpDir = Platform.isLinux
          ? await (getDownloadsDirectory()) ??
              (await getApplicationDocumentsDirectory())
          : Platform.isAndroid
              ? (await getExternalStorageDirectory()) ??
                  (await getApplicationDocumentsDirectory())
              : await getApplicationDocumentsDirectory();
      final tmpFile = File(
          '${tmpDir.path}/fun_with_kanji_export_${DateTime.now().toIso8601String()}.json');
      await tmpFile.writeAsString(exportStr);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(L10n.of(context)!.savedAt(tmpFile.path)),
        duration: const Duration(seconds: 10),
      ));
    } catch (e, s) {
      showOpenIssueDialog(context, e, s);
      rethrow;
    }
  }

  void importAction() async {
    final picked = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
      withData: true,
      allowMultiple: false,
    );
    if (picked == null || picked.files.length != 1) return;
    try {
      final bytes = picked.files.single.bytes!;
      final jsonStr = await compute(String.fromCharCodes, bytes);
      final json = await compute(jsonDecode, jsonStr);
      await FunWithKanji.of(context).import(json);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(L10n.of(context)!.importFinished),
      ));
    } catch (e, s) {
      showOpenIssueDialog(context, e, s);
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) => SettingsView(this);
}
