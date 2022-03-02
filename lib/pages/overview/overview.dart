// ignore_for_file: prefer_function_declarations_over_variables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fun_with_kanji/models/jp_character.dart';
import 'package:fun_with_kanji/models/kana.dart';
import 'package:fun_with_kanji/models/kanji.dart';
import 'package:fun_with_kanji/models/radical.dart';
import 'package:fun_with_kanji/models/script_loader.dart';
import 'package:fun_with_kanji/pages/overview/hiragana_viewer.dart';
import 'package:fun_with_kanji/pages/overview/kanji_viewer.dart';
import 'package:fun_with_kanji/pages/overview/katakana_viewer.dart';
import 'package:fun_with_kanji/pages/overview/overview_view.dart';
import 'package:fun_with_kanji/pages/overview/radicals_viewer.dart';
import 'package:fun_with_kanji/utils/writing_system.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  OverviewController createState() => OverviewController();
}

class OverviewController extends State<OverviewPage> {
  bool searchLoading = false;
  List<JpCharacter>? searchResult;
  Timer? _searchTimeout;
  final TextEditingController searchController = TextEditingController();

  void search(String text) {
    _searchTimeout?.cancel();
    _searchTimeout = Timer(
      const Duration(milliseconds: 600),
      () => _search(text),
    );
  }

  void _search(text) async {
    if (text.isEmpty) {
      cancelSearch();
      return;
    }
    setState(() {
      searchLoading = true;
    });
    final result = <JpCharacter>[];

    final kanaTest = (Kana kana) =>
        kana.kana.contains(text) || kana.roumaji.toLowerCase().contains(text);

    final radicalTest = (Radical radical) =>
        radical.radical.contains(text) ||
        radical.name.toLowerCase().contains(text) ||
        radical.description.toLowerCase().contains(text);

    final kanjiTest = (Kanji kanji) =>
        kanji.kanji.contains(text) ||
        kanji.meanings.join('').toLowerCase().contains(text) ||
        kanji.readingsKun.join('').toLowerCase().contains(text) ||
        kanji.readingsOn.join('').toLowerCase().contains(text) ||
        kanji.radicals.join('').toLowerCase().contains(text);

    final hiragana = await ScriptLoader.loadHiragana();
    if (!searchLoading) return;
    result.addAll(hiragana.where(kanaTest));
    hiragana.clear();

    final katakana = await ScriptLoader.loadKatakana();
    if (!searchLoading) return;
    result.addAll(katakana.where(kanaTest));
    katakana.clear();

    final radicals = await ScriptLoader.loadRadicals();
    if (!searchLoading) return;
    result.addAll(radicals.where(radicalTest));
    radicals.clear();

    for (var i = 1; i <= 8; i++) {
      final kanji = await ScriptLoader.loadKanji(i);
      if (!searchLoading) return;
      result.addAll(kanji.where(kanjiTest));
      kanji.clear();
    }

    setState(() {
      searchResult = result;
      searchLoading = false;
    });
  }

  void cancelSearch() {
    _searchTimeout?.cancel();
    searchController.clear();

    setState(() {
      searchResult = null;
      searchLoading = false;
    });
  }

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
