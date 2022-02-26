import 'package:flutter/material.dart';
import 'package:funny_kanji/pages/overview/hiragana_viewer.dart';
import 'package:funny_kanji/pages/overview/kanji_viewer.dart';
import 'package:funny_kanji/pages/overview/katakana_viewer.dart';
import 'package:funny_kanji/pages/overview/overview_view.dart';
import 'package:funny_kanji/pages/overview/radicals_viewer.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  OverviewController createState() => OverviewController();
}

class OverviewController extends State<OverviewPage> {
  void goToHiraganaViewer() => Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => const HiraganaViewer(),
      ));

  void goToKatakanaViewer() => Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => const KatakanaViewer(),
      ));

  void goToRadicalsViewer() => Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => const RadicalsViewer(),
      ));

  void goToKanjiViewer(int level) =>
      Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => KanjiViewer(level: level),
      ));

  @override
  Widget build(BuildContext context) => OverviewPageView(this);
}
