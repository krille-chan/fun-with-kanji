import 'package:flutter/material.dart';
import 'package:funny_kanji/pages/overview/overview.dart';

class OverviewPageView extends StatelessWidget {
  final OverviewController controller;
  const OverviewPageView(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overview'),
      ),
      body: ListView(children: [
        ListTile(
          leading: const CircleAvatar(child: Text('ひ')),
          title: Text('Hiragana'),
          subtitle: Text('199 entries'),
          onTap: controller.goToHiraganaViewer,
        ),
        ListTile(
          leading: const CircleAvatar(child: Text('カ')),
          title: Text('Katakana'),
          subtitle: Text('105 entries'),
          onTap: controller.goToKatakanaViewer,
        ),
        ListTile(
          leading: const CircleAvatar(child: Text('ら')),
          title: Text('Radicals'),
          subtitle: Text('232 entries'),
          onTap: controller.goToRadicalsViewer,
        ),
        ListTile(
          leading: const CircleAvatar(child: Text('一')),
          title: Text('Kanji Level 1'),
          subtitle: Text('267 entries'),
          onTap: () => controller.goToKanjiViewer(1),
        ),
        ListTile(
          leading: const CircleAvatar(child: Text('所')),
          title: Text('Kanji Level 2'),
          subtitle: Text('267 entries'),
          onTap: () => controller.goToKanjiViewer(2),
        ),
        ListTile(
          leading: const CircleAvatar(child: Text('典')),
          title: Text('Kanji Level 3'),
          subtitle: Text('267 entries'),
          onTap: () => controller.goToKanjiViewer(3),
        ),
        ListTile(
          leading: const CircleAvatar(child: Text('述')),
          title: Text('Kanji Level 4'),
          subtitle: Text('267 entries'),
          onTap: () => controller.goToKanjiViewer(4),
        ),
        ListTile(
          leading: const CircleAvatar(child: Text('訳')),
          title: Text('Kanji Level 5'),
          subtitle: Text('267 entries'),
          onTap: () => controller.goToKanjiViewer(5),
        ),
        ListTile(
          leading: const CircleAvatar(child: Text('儀')),
          title: Text('Kanji Level 6'),
          subtitle: Text('267 entries'),
          onTap: () => controller.goToKanjiViewer(6),
        ),
        ListTile(
          leading: const CircleAvatar(child: Text('拘')),
          title: Text('Kanji Level 7'),
          subtitle: Text('267 entries'),
          onTap: () => controller.goToKanjiViewer(7),
        ),
        ListTile(
          leading: const CircleAvatar(child: Text('窃')),
          title: Text('Kanji Level 8'),
          subtitle: Text('267 entries'),
          onTap: () => controller.goToKanjiViewer(8),
        ),
      ]),
    );
  }
}
