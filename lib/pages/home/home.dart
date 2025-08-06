import 'package:flutter/material.dart';

import 'package:fun_with_kanji/generated/l10n.dart';

import 'package:fun_with_kanji/models/fun_with_kanji.dart';
import 'package:fun_with_kanji/pages/home/home_view.dart';
import 'package:fun_with_kanji/pages/learning/learning.dart';
import 'package:fun_with_kanji/utils/writing_system.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageController createState() => HomePageController();
}

class HomePageController extends State<HomePage> {
  void learnSystem(WritingSystem writingSystem) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => LearningPage(writingSystem: writingSystem),
        ),
      );

  void writingSystemSettings(WritingSystem writingSystem) async {
    final action = await showDialog<WritingSystemSettingsAction?>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(L10n.of(context)!.settings),
        content: SizedBox(
          width: double.maxFinite,
          height: 128,
          child: ListView(
            children: WritingSystemSettingsAction.values
                .map(
                  (action) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(action.localizedName(context)),
                    leading: Icon(action.icon),
                    onTap: () => Navigator.of(context).pop(action),
                  ),
                )
                .toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(null),
            child: Text(L10n.of(context)!.cancel),
          ),
        ],
      ),
    );
    if (action == null) return;

    switch (action) {
      case WritingSystemSettingsAction.reset:
        FunWithKanji.of(context).resetLearningProgressForSystem(writingSystem);
        break;
    }
  }

  @override
  Widget build(BuildContext context) => HomePageView(this);
}

enum WritingSystemSettingsAction { reset }

extension on WritingSystemSettingsAction {
  String localizedName(BuildContext context) {
    switch (this) {
      case WritingSystemSettingsAction.reset:
        return L10n.of(context)!.reset;
    }
  }

  IconData get icon {
    switch (this) {
      case WritingSystemSettingsAction.reset:
        return Icons.delete_outlined;
    }
  }
}
