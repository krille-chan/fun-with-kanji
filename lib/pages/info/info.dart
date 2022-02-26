import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16);
    const headerStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar:
          AppBar(title: Text(L10n.of(context)!.learnJapaneseLetteringSystems)),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          SelectableText(
            L10n.of(context)!.learnJapaneseLetteringSystemsDesc,
            style: textStyle,
          ),
          const SizedBox(height: 12),
          SelectableText(
            L10n.of(context)!.hiragana,
            style: headerStyle,
          ),
          const SizedBox(height: 12),
          SelectableText(
            L10n.of(context)!.hiraganaDesc,
            style: textStyle,
          ),
          const SizedBox(height: 12),
          SelectableText(
            L10n.of(context)!.katakana,
            style: headerStyle,
          ),
          const SizedBox(height: 12),
          SelectableText(
            L10n.of(context)!.katakanaDesc,
            style: textStyle,
          ),
          const SizedBox(height: 12),
          SelectableText(
            L10n.of(context)!.radicals,
            style: headerStyle,
          ),
          const SizedBox(height: 12),
          SelectableText(
            L10n.of(context)!.radicalsDesc,
            style: textStyle,
          ),
          const SizedBox(height: 12),
          SelectableText(
            L10n.of(context)!.kanji,
            style: headerStyle,
          ),
          const SizedBox(height: 12),
          SelectableText(
            L10n.of(context)!.kanjiDesc,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
