import 'package:flutter/material.dart';
import 'package:funny_kanji/pages/overview/hiragana_viewer.dart';
import 'package:funny_kanji/pages/overview/kanji_viewer.dart';
import 'package:funny_kanji/pages/overview/katakana_viewer.dart';
import 'package:funny_kanji/pages/overview/overview_view.dart';
import 'package:funny_kanji/pages/overview/radicals_viewer.dart';
import 'package:funny_kanji/utils/writing_system.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  OverviewController createState() => OverviewController();
}

class OverviewController extends State<OverviewPage> {
  void goToViewer(WritingSystem writingSystem) {
    switch (writingSystem) {
      case WritingSystem.hiragana:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => const HiraganaViewer(),
        ));
        break;
      case WritingSystem.katakana:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => const KatakanaViewer(),
        ));
        break;
      case WritingSystem.radicals:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => const RadicalsViewer(),
        ));
        break;
      case WritingSystem.kanji1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => const KanjiViewer(level: 1),
        ));
        break;
      case WritingSystem.kanji2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => const KanjiViewer(level: 2),
        ));
        break;
      case WritingSystem.kanji3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => const KanjiViewer(level: 3),
        ));
        break;
      case WritingSystem.kanji4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => const KanjiViewer(level: 4),
        ));
        break;
      case WritingSystem.kanji5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => const KanjiViewer(level: 5),
        ));
        break;
      case WritingSystem.kanji6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => const KanjiViewer(level: 6),
        ));
        break;
      case WritingSystem.kanji7:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => const KanjiViewer(level: 7),
        ));
        break;
      case WritingSystem.kanji8:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => const KanjiViewer(level: 8),
        ));
        break;
    }
  }

  @override
  Widget build(BuildContext context) => OverviewPageView(this);
}
