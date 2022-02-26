import 'package:flutter/material.dart';
import 'package:funny_kanji/pages/overview/overview.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:yaru_icons/yaru_icons.dart';

class OverviewPageView extends StatelessWidget {
  final OverviewController controller;
  const OverviewPageView(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context)!.overview),
      ),
      body: ListView(children: [
        ListTile(
          leading: const CircleAvatar(child: Text('ひ')),
          title: Text(L10n.of(context)!.hiragana),
          subtitle: Text(L10n.of(context)!.countEntries('199')),
          onTap: controller.goToHiraganaViewer,
          trailing: const Icon(YaruIcons.go_next),
        ),
        ListTile(
          leading: const CircleAvatar(child: Text('カ')),
          title: Text(L10n.of(context)!.katakana),
          subtitle: Text(L10n.of(context)!.countEntries('105')),
          onTap: controller.goToKatakanaViewer,
          trailing: const Icon(YaruIcons.go_next),
        ),
        ListTile(
          leading: const CircleAvatar(child: Text('ら')),
          title: Text(L10n.of(context)!.radicals),
          subtitle: Text(L10n.of(context)!.countEntries('232')),
          onTap: controller.goToRadicalsViewer,
          trailing: const Icon(YaruIcons.go_next),
        ),
        ListTile(
          leading: const CircleAvatar(child: Text('一')),
          title: Text(L10n.of(context)!.kanjiLevel('1')),
          subtitle: Text(L10n.of(context)!.countEntries('267')),
          onTap: () => controller.goToKanjiViewer(1),
          trailing: const Icon(YaruIcons.go_next),
        ),
        ListTile(
          leading: const CircleAvatar(child: Text('所')),
          title: Text(L10n.of(context)!.kanjiLevel('2')),
          subtitle: Text(L10n.of(context)!.countEntries('267')),
          onTap: () => controller.goToKanjiViewer(2),
          trailing: const Icon(YaruIcons.go_next),
        ),
        ListTile(
          leading: const CircleAvatar(child: Text('典')),
          title: Text(L10n.of(context)!.kanjiLevel('3')),
          subtitle: Text(L10n.of(context)!.countEntries('267')),
          onTap: () => controller.goToKanjiViewer(3),
          trailing: const Icon(YaruIcons.go_next),
        ),
        ListTile(
          leading: const CircleAvatar(child: Text('述')),
          title: Text(L10n.of(context)!.kanjiLevel('4')),
          subtitle: Text(L10n.of(context)!.countEntries('267')),
          onTap: () => controller.goToKanjiViewer(4),
          trailing: const Icon(YaruIcons.go_next),
        ),
        ListTile(
          leading: const CircleAvatar(child: Text('訳')),
          title: Text(L10n.of(context)!.kanjiLevel('5')),
          subtitle: Text(L10n.of(context)!.countEntries('267')),
          onTap: () => controller.goToKanjiViewer(5),
          trailing: const Icon(YaruIcons.go_next),
        ),
        ListTile(
          leading: const CircleAvatar(child: Text('儀')),
          title: Text(L10n.of(context)!.kanjiLevel('6')),
          subtitle: Text(L10n.of(context)!.countEntries('267')),
          onTap: () => controller.goToKanjiViewer(6),
          trailing: const Icon(YaruIcons.go_next),
        ),
        ListTile(
          leading: const CircleAvatar(child: Text('拘')),
          title: Text(L10n.of(context)!.kanjiLevel('7')),
          subtitle: Text(L10n.of(context)!.countEntries('267')),
          onTap: () => controller.goToKanjiViewer(7),
          trailing: const Icon(YaruIcons.go_next),
        ),
        ListTile(
          leading: const CircleAvatar(child: Text('窃')),
          title: Text(L10n.of(context)!.kanjiLevel('8')),
          subtitle: Text(L10n.of(context)!.countEntries('267')),
          onTap: () => controller.goToKanjiViewer(8),
          trailing: const Icon(YaruIcons.go_next),
        ),
      ]),
    );
  }
}
